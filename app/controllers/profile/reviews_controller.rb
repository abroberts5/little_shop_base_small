class Profile::ReviewsController < ApplicationController

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
    @review.each do |review|
      if review.save
        redirect_to item_path(review.item)
        flash[:success] = 'Your Review is Recorded'
      else
        render :new
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:item_id, :user_id, :title, :description, :rating)
  end
end
