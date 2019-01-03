require 'rails_helper'

describe 'Profile Orders page' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @merchant_1 = create(:merchant)

    @item_1 = create(:item, user: @merchant_1, price: 100.00)

    @order = create(:order, user: @user)

    yesterday = 1.day.ago
    @order_item_1 = create(:order_item, order: @order, item: @item_1, created_at: yesterday, updated_at: yesterday)
    # @order_item_2 = create(:fulfilled_order_item, order: @order, item: @item_2, quantity: 1, created_at: yesterday, updated_at: 2.hours.ago)
  end
  describe 'as a registered user' do
    it 'can see the order and be able to rate product' do
      visit profile_order_path(@order)

      expect(page).to have_content("please leave rating:")
    end
  end
end
