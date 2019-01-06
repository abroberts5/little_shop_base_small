require 'rails_helper'

describe 'As an admin' do
  before :each do
    @admin = create(:user, role: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    @merchant_1 = create(:merchant)

    @item_1 = create(:item, user: @merchant_1, price: 100.00)
    user = create(:user)
    @order = create(:order, user: user)

    yesterday = 1.day.ago
    @order_item_1 = create(:fulfilled_order_item, order: @order, item: @item_1, created_at: yesterday, updated_at: yesterday)
    @item_1.reviews.create(user_id: user.id, title: "Silly Wabbit", description: "tricks are for kids", rating: 4, created_at: yesterday, updated_at: yesterday)
    end
    it 'can see a button to disable user review' do
      visit item_path(@item_1)

      expect(page).to have_button("disable review")

      click_button 'disable review'

      expect(page).to have_content("your review is disabled")
      expect(page).not_to have_content('I like this case a lot')
  end
    it 'makes sure a merchant cannot see button to disable' do
      merch = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merch)

      @item_1 = create(:item, user: merch, price: 100.00)
      user = create(:user)
      @order = create(:order, user: user)

      yesterday = 1.day.ago
      @order_item_1 = create(:fulfilled_order_item, order: @order, item: @item_1, created_at: yesterday, updated_at: yesterday)
      @item_1.reviews.create(user_id: user.id, title: "Silly Wabbit", description: "tricks are for kids", rating: 4, created_at: yesterday, updated_at: yesterday)

      visit item_path(@item_1)

      expect(page).not_to have_button("disable review")
  end
end
