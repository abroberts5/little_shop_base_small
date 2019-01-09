class User < ApplicationRecord
  has_secure_password

  has_many :items, foreign_key: 'merchant_id'
  has_many :orders
  has_many :order_items, through: :orders
  has_many :reviews

  validates_presence_of :name, :address, :city, :state, :zip
  validates :email, presence: true, uniqueness: true

  enum role: [:default, :merchant, :admin]

  def self.top_3_revenue_merchants
    User.joins(items: :order_items)
      .select('users.*, sum(order_items.quantity * order_items.price) as revenue')
      .where('order_items.fulfilled=?', true)
      .order('revenue desc')
      .group(:id)
      .limit(3)
  end

  def self.merchant_fulfillment_times(order, count)
    User.joins(items: :order_items)
      .select('users.*, avg(order_items.updated_at - order_items.created_at) as avg_fulfillment_time')
      .where('order_items.fulfilled=?', true)
      .order("avg_fulfillment_time #{order}")
      .group(:id)
      .limit(count)
  end

  def self.top_3_fulfilling_merchants
    merchant_fulfillment_times(:asc, 3)
  end

  def self.bottom_3_fulfilling_merchants
    merchant_fulfillment_times(:desc, 3)
  end

  def self.top_10_merch_this_month(count)
    User.joins(items: :order_items)
      .select('users.*, sum(order_items.quantity) as top_sold')
      .where("extract(month FROM order_items.updated_at) =? AND order_items.fulfilled = ? ", Time.now.month, true)
      .group(:id)
      .order('top_sold desc')
      .limit(count)
  end

  def self.top_10_merch_last_month(count)
    User.joins(items: :order_items)
      .select('users.*, sum(order_items.quantity) as top_sold')
      .where("extract(month FROM order_items.updated_at) =? AND order_items.fulfilled = ? ", Time.now.last_month.month, true)
      .group(:id)
      .order('top_sold desc')
      .limit(count)
  end

  def self.top_merch_orders_this_month(count)
    User.joins(items: :orders)
      .select('users.*, count(order_items.id) as order_count')
      .where("extract(month FROM order_items.updated_at) =? AND order_items.fulfilled =? AND orders.status !=?", Time.now.month, true, 2)
      .group(:id)
      .order('order_count desc')
      .limit(count)
  end

  def self.top_merch_orders_last_month(count)
    User.joins(items: :orders)
      .select('users.*, count(order_items.id) as order_count')
      .where("extract(month FROM order_items.updated_at) =? AND order_items.fulfilled =? AND orders.status !=?", Time.now.last_month.month, true, 2)
      .group(:id)
      .order('order_count desc')
      .limit(count)
  end

  def self.top_merch_in_state(pass_user)
    order_list = Order.joins(:user).where( "users.state = ? AND orders.status = ?", pass_user.state, 1 ).distinct.pluck(:id)
    User.joins(items: :orders)
      .select('users.*, avg(order_items.created_at - order_items.updated_at) as avg_fulfilled')
      .where("orders.id IN (?) AND order_items.fulfilled=?", order_list, true)
      .group(:id)
      .order('avg_fulfilled desc')
      .limit(5)
  end

  def self.top_merch_in_city(pass_user)
    order_list = Order.joins(:user).where( "users.state=? AND users.city=? AND orders.status = ?", pass_user.state, pass_user.city, 1 ).distinct.pluck(:id)
    User.joins(items: :orders)
      .select('users.*, avg(order_items.created_at - order_items.updated_at) as avg_fulfilled')
      .where("orders.id IN (?) AND order_items.fulfilled=?", order_list, true)
      .group(:id)
      .order('avg_fulfilled desc')
      .limit(5)
  end

  def my_pending_orders
    Order.joins(order_items: :item)
      .where("items.merchant_id=? AND orders.status=? AND order_items.fulfilled=?", self.id, 0, false)
  end

  def inventory_check(item_id)
    return nil unless self.merchant?
    Item.where(id: item_id, merchant_id: self.id).pluck(:inventory).first
  end

  def top_items_by_quantity(count)
    self.items
      .joins(:order_items)
      .select('items.*, sum(order_items.quantity) as quantity_sold')
      .where("order_items.fulfilled = ?", true)
      .group(:id)
      .order('quantity_sold desc')
      .limit(count)
  end

  def quantity_sold_percentage
    sold = self.items.joins(:order_items).where('order_items.fulfilled=?', true).sum('order_items.quantity')
    total = self.items.sum(:inventory) + sold
    {
      sold: sold,
      total: total,
      percentage: ((sold.to_f/total)*100).round(2)
    }
  end

  def top_3_states
    Item.joins('inner join order_items oi on oi.item_id=items.id inner join orders o on o.id=oi.order_id inner join users u on o.user_id=u.id')
      .select('u.state, sum(oi.quantity) as quantity_shipped')
      .where("oi.fulfilled = ? AND items.merchant_id=?", true, self.id)
      .group(:state)
      .order('quantity_shipped desc')
      .limit(3)
  end

  def top_3_cities
    Item.joins('inner join order_items oi on oi.item_id=items.id inner join orders o on o.id=oi.order_id inner join users u on o.user_id=u.id')
      .select('u.city, u.state, sum(oi.quantity) as quantity_shipped')
      .where("oi.fulfilled = ? AND items.merchant_id=?", true, self.id)
      .group(:state, :city)
      .order('quantity_shipped desc')
      .limit(3)
  end

  def most_ordering_user
    User.joins('inner join orders o on o.user_id=users.id inner join order_items oi on oi.order_id=o.id inner join items i on i.id=oi.item_id')
      .select('users.*, count(o.id) as order_count')
      .where("oi.fulfilled = ? AND i.merchant_id=?", true, self.id)
      .group(:id)
      .order('order_count desc')
      .limit(1)
      .first
  end

  def most_items_user
    User.joins('inner join orders o on o.user_id=users.id inner join order_items oi on oi.order_id=o.id inner join items i on i.id=oi.item_id')
      .select('users.*, sum(oi.quantity) as item_count')
      .where("oi.fulfilled = ? AND i.merchant_id=?", true, self.id)
      .group(:id)
      .order('item_count desc')
      .limit(1)
      .first
  end

  def top_3_revenue_users
    User.joins('inner join orders o on o.user_id=users.id inner join order_items oi on oi.order_id=o.id inner join items i on i.id=oi.item_id')
      .select('users.*, sum(oi.quantity*oi.price) as revenue')
      .where("oi.fulfilled = ? AND i.merchant_id=?", true, self.id)
      .group(:id)
      .order('revenue desc')
      .limit(3)
  end
end
