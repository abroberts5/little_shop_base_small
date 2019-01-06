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
  end
end
