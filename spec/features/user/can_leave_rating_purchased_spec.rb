require 'rails_helper'

describe 'Profile Orders page' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @merchant_1 = create(:merchant)

    @item_1 = create(:item, user: @merchant_1, price: 100.00)

    @order = create(:order, user: @user)

    yesterday = 1.day.ago
    @order_item_1 = create(:fulfilled_order_item, order: @order, item: @item_1, created_at: yesterday, updated_at: yesterday)
  end
  describe 'as a registered user' do
    it 'can see the order and be able to rate product' do
      visit profile_order_path(@order)

      expect(page).to have_content("click to leave review")

      click_link "click to leave review"

      expect(current_path).to eq(new_profile_order_review_path(@order))

      fill_in :review_title, with: 'hey'
      fill_in :review_description, with: 'I like this case a lot'
      fill_in :review_rating, with: 4
      click_button 'Create Review'

      expect(current_path).to eq(item_path(@item_1))

      expect(page).to have_content(@item_1.reviews.first.title)
      expect(page).to have_content(@item_1.reviews.first.description)
      expect(page).to have_content(@item_1.reviews.first.rating)
    end
    it 'user can disable a review theyve created' do
      visit profile_order_path(@order)

      click_link "click to leave review"

      fill_in :review_title, with: 'hey'
      fill_in :review_description, with: 'I like this case a lot'
      fill_in :review_rating, with: 4
      click_button 'Create Review'

      expect(page).to have_button("disable review")

      click_button 'disable review'

      expect(page).to have_content("your review is disabled")
      expect(page).not_to have_content('I like this case a lot')
    end
    it 'shows average rating on Item Catalog page as well as the Item Show page' do
      @user_2 = create(:user)
      @item_2 = create(:item, user: @merchant_1, price: 200.00)
      @order_item_2 = create(:fulfilled_order_item, order: @order, item: @item_2, created_at: 2.days.ago, updated_at: 2.days.ago)

      @item_2.reviews.create(user_id: @user.id, title: "Silly Wabbit", description: "tricks are for kids", rating: 4, created_at: 1.day.ago, updated_at: 1.day.ago)
      @item_2.reviews.create(user_id: @user_2.id, title: "Best since sliced bread", description: "can't wait to tell my mother about this", rating: 5, created_at: 1.day.ago, updated_at: 1.day.ago)

      visit items_path

      expect(page).to have_content("Average Rating: 4.5")

      visit item_path(@item_2)

      expect(page).to have_content("Average Rating: 4.5")
    end
    it 'doesnt show average rating if review disabled' do
      @user_2 = create(:user)
      @item_2 = create(:item, user: @merchant_1, price: 200.00)
      @order_item_2 = create(:fulfilled_order_item, order: @order, item: @item_2, created_at: 2.days.ago, updated_at: 2.days.ago)

      @item_2.reviews.create(user_id: @user.id, title: "Silly Wabbit", description: "tricks are for kids", rating: 4, created_at: 1.day.ago, updated_at: 1.day.ago)
      @item_2.reviews.create(user_id: @user_2.id, title: "Best since sliced bread", description: "can't wait to tell my mother about this", status: false, rating: 5, created_at: 1.day.ago, updated_at: 1.day.ago)

      visit item_path(@item_2)

      expect(page).to have_content("Average Rating: 4")
    end
  end
end
