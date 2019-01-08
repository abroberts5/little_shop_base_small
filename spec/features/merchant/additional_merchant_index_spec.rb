require 'rails_helper'

describe 'Merchant Index Page' do
  describe 'it shows statistics' do
    before :each do
      @user_1 = create(:user, city: 'Denver', state: 'CO')
      @user_2 = create(:user, city: 'NYC', state: 'NY')
      @user_3 = create(:user, city: 'Seattle', state: 'WA')
      @user_4 = create(:user, city: 'Seattle', state: 'FL')

      @merchant_1 = create(:merchant, name: 'Merchant Name 1')
      @merchant_2 = create(:merchant, name: 'Merchant Name 2')
      @merchant_3 = create(:merchant, name: 'Merchant Name 3')
      @merchant_4 = create(:merchant, name: 'Merchant Name 4')
      @merchant_5 = create(:merchant, name: 'Merchant Name 5')
      @merchant_6 = create(:merchant, name: 'Merchant Name 6')
      @merchant_7 = create(:merchant, name: 'Merchant Name 7')
      @merchant_8 = create(:merchant, name: 'Merchant Name 8')
      @merchant_9 = create(:merchant, name: 'Merchant Name 9')
      @merchant_10 = create(:merchant, name: 'Merchant Name 10')
      @merchant_11 = create(:merchant, name: 'Merchant Name 11')
      @merchant_12 = create(:merchant, name: 'Merchant Name 12')
      @merchant_13 = create(:merchant, name: 'Merchant Name 13')
      @merchant_14 = create(:merchant, name: 'Merchant Name 14')
      @merchant_15 = create(:merchant, name: 'Merchant Name 15')

      @item_1 = create(:item, user: @merchant_1)
      @item_2 = create(:item, user: @merchant_2)
      @item_3 = create(:item, user: @merchant_3)
      @item_4 = create(:item, user: @merchant_4)
      @item_5 = create(:item, user: @merchant_5)
      @item_6 = create(:item, user: @merchant_6)
      @item_7 = create(:item, user: @merchant_7)
      @item_8 = create(:item, user: @merchant_8)
      @item_9 = create(:item, user: @merchant_9)
      @item_10 = create(:item, user: @merchant_10)
      @item_11 = create(:item, user: @merchant_5)
      @item_12 = create(:item, user: @merchant_8)
      @item_13 = create(:item, user: @merchant_3)
      @item_14 = create(:item, user: @merchant_1)

      @order_1 = create(:completed_order, user: @user_1)
      @oi_1 = create(:fulfilled_order_item, item: @item_1, order: @order_1, quantity: 100, price: 100, created_at: 10.minutes.ago, updated_at: 9.minutes.ago)

      @order_2 = create(:completed_order, user: @user_2)
      @oi_2 = create(:fulfilled_order_item, item: @item_2, order: @order_2, quantity: 300, price: 300, created_at: 2.days.ago, updated_at: 1.minutes.ago)

      @order_3 = create(:completed_order, user: @user_3)
      @oi_3 = create(:fulfilled_order_item, item: @item_3, order: @order_3, quantity: 200, price: 200, created_at: 10.minutes.ago, updated_at: 51.minutes.ago)

      @order_4 = create(:completed_order, user: @user_4)
      @oi_4 = create(:fulfilled_order_item, item: @item_4, order: @order_4, quantity: 201, price: 200, created_at: 10.minutes.ago, updated_at: 52.minutes.ago)
      #
      @order_5 = create(:completed_order, user: @user_3)
      @oi_5 = create(:fulfilled_order_item, item: @item_5, order: @order_5, quantity: 201, price: 100, created_at: 5.days.ago, updated_at: 40.minutes.ago)

      @order_6 = create(:completed_order, user: @user_1)
      @oi_6 = create(:fulfilled_order_item, item: @item_6, order: @order_6, quantity: 201, price: 200, created_at: 10.days.ago, updated_at: 30.minutes.ago)

      @order_7 = create(:completed_order, user: @user_4)
      @oi_7 = create(:fulfilled_order_item, item: @item_7, order: @order_7, quantity: 201, price: 150, created_at: 17.days.ago, updated_at: 17.minutes.ago)

      @order_8 = create(:completed_order, user: @user_2)
      @oi_8 = create(:fulfilled_order_item, item: @item_8, order: @order_8, quantity: 201, price: 175, created_at: 19.days.ago, updated_at: 27.minutes.ago)

      @order_9 = create(:completed_order, user: @user_4)
      @oi_9 = create(:fulfilled_order_item, item: @item_9, order: @order_9, quantity: 201, price: 210, created_at: 25.days.ago, updated_at: 59.minutes.ago)

      @order_10 = create(:completed_order, user: @user_1)
      @oi_10 = create(:fulfilled_order_item, item: @item_10, order: @order_10, quantity: 201, price: 300, created_at: 25.days.ago, updated_at: 1.day.ago)
    end
    it 'shows the top 10 merchants who sold the most items this month' do
      visit merchants_path

      within '#statistics' do
        within '#top-10-merchant-items-this-month' do
          expect(page).to have_content(@merchant_1.name, @merchant_2.name, @merchant_3.name, @merchant_4.name, @merchant_5.name,
            @merchant_6.name, @merchant_7.name, @merchant_8.name, @merchant_9.name, @merchant_10.name)
        end
      end
    end
    it 'shows the top 10 merchants who sold the most items last month' do
      @oi_1.update(updated_at: 1.month.ago)
      @oi_2.update(updated_at: 1.month.ago)
      @oi_3.update(updated_at: 1.month.ago)
      @oi_4.update(updated_at: 1.month.ago)
      @oi_5.update(updated_at: 1.month.ago)
      @oi_6.update(updated_at: 1.month.ago)
      @oi_7.update(updated_at: 1.month.ago)
      @oi_8.update(updated_at: 1.month.ago)
      @oi_9.update(updated_at: 1.month.ago)
      @oi_10.update(updated_at: 1.month.ago)

      visit merchants_path

      within '#statistics' do
        within '#top-10-merchant-items-last-month' do
          expect(page).to have_content(@merchant_1.name, @merchant_2.name, @merchant_3.name, @merchant_4.name, @merchant_5.name,
            @merchant_6.name, @merchant_7.name, @merchant_8.name, @merchant_9.name, @merchant_10.name)
        end
      end
    end
  end
end
