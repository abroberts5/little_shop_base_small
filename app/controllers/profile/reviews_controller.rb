class Profile::ReviewsController < ApplicationController
  before_action :require_default_user, only: :index

  def new
    @order = Order.find(params[:order_id])
    @item = Item.find(@order.order_items.first.item_id)
    @review = Review.new
    @profile = [:profile, @order, @review]
  end

  def create
    @order = Order.find(params[:order_id])
    @items = @order.items
    @review = []
    @items.each do |item|
    @review << item.reviews.create(item_id: item.id,
                      user_id: current_user.id,
                      title: review_params[:title],
                      description: review_params[:description],
                      rating: review_params[:rating].to_i)
    end
    if @review.first.save
      redirect_to profile_order_path(@order)
      flash[:success] = 'Your Review is Recorded'
    else
      render :new
    end
  end

  def disable
    @review = Review.find(params[:format])
    @review.status = false
    @review.save
    redirect_to item_path(@review.item)
    flash[:success] = "your review is disabled"
  end

  private

  def review_params
    params.require(:review).permit(:item_id, :user_id, :title, :description, :rating)
  end

  def require_default_user
    render file: 'errors/not_found', status: 404 unless current_user && current_user.default?
  end
end
