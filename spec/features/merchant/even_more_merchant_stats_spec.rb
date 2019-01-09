require 'rails_helper'

describe 'additional Merchant Stats for states and cities' do
  before :each do
    @user_19 = create(:user, role: 0, city: 'Denver', state: 'CO')
    @user_20 = create(:user, role: 0, city: 'NYC', state: 'NY')
    @user_21 = create(:user, role: 0, city: 'Seattle', state: 'WA')
    @user_22 = create(:user, role: 0, city: 'Seattle', state: 'WA')
    @user_23 = create(:user, role: 0, city: 'Seattle', state: 'WA')

    @merchant_16 = create(:merchant, name: 'Merchant 16', city: 'Denver', state: 'CO')
    @merchant_17 = create(:merchant, name: 'Merchant 17', city: 'NYC', state: 'NY')
    @merchant_18 = create(:merchant, name: 'Merchant 18', city: 'Seattle', state: 'WA')
    @merchant_19 = create(:merchant, name: 'Merchant 19', city: 'Seattle', state: 'WA')
    @merchant_20 = create(:merchant, name: 'Merchant 20', city: 'Seattle', state: 'WA')
    @merchant_21 = create(:merchant, name: 'Merchant 21', city: 'Seattle', state: 'WA')
    @merchant_22 = create(:merchant, name: 'Merchant 22', city: 'Seattle', state: 'WA')
    @merchant_23 = create(:merchant, name: 'Merchant 23', city: 'Boston', state: 'MA')

    item_1 = create(:item, user: @merchant_16)
    item_5 = create(:item, user: @merchant_16)
    order_1 = create(:completed_order, user: @user_19, created_at: 2.months.ago, updated_at: 1.month.ago)
    order_5 = create(:completed_order, user: @user_19, created_at: 2.months.ago, updated_at: 1.month.ago)
    order_6 = create(:order, user: @user_19, created_at: 2.months.ago, updated_at: 1.month.ago)
    create(:fulfilled_order_item, item: item_1, order: order_1, created_at: 1.month.ago, updated_at: 1.month.ago)
    create(:fulfilled_order_item, item: item_5, order: order_5, created_at: 1.month.ago, updated_at: 1.month.ago)
    create(:order_item, item: item_5, order: order_6, created_at: 1.month.ago, updated_at: 1.month.ago)

    item_2 = create(:item, user: @merchant_17)
    item_6 = create(:item, user: @merchant_17)
    order_2 = create(:completed_order, user: @user_20, created_at: 2.months.ago, updated_at: 1.month.ago)
    order_7 = create(:completed_order, user: @user_20, created_at: 2.months.ago, updated_at: 1.month.ago)
    order_8 = create(:order, user: @user_20, created_at: 2.months.ago, updated_at: 1.month.ago)
    create(:fulfilled_order_item, item: item_2, order: order_2, created_at: 1.month.ago, updated_at: 1.month.ago)
    create(:fulfilled_order_item, item: item_6, order: order_7, created_at: 1.month.ago, updated_at: 1.month.ago)
    create(:order_item, item: item_6, order: order_8, created_at: 1.month.ago, updated_at: 1.month.ago)

    item_3 = create(:item, user: @merchant_18)
    item_7 = create(:item, user: @merchant_18)
    order_3 = create(:cancelled_order, user: @user_21, created_at: 10.days.ago, updated_at: 20.minutes.ago)
    order_9 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 1.minute.ago)
    order_10 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 1.minute.ago)
    create(:fulfilled_order_item, item: item_3, order: order_3, created_at: 1.minute.ago, updated_at: 1.minute.ago)
    create(:fulfilled_order_item, item: item_7, order: order_9, created_at: 1.minute.ago, updated_at: 1.minute.ago)
    create(:fulfilled_order_item, item: item_7, order: order_10, created_at: 1.minute.ago, updated_at: 1.minute.ago)

    item_4 = create(:item, user: @merchant_19)
    item_8 = create(:item, user: @merchant_19)
    order_4 = create(:cancelled_order, user: @user_22, created_at: 10.days.ago, updated_at: 18.minutes.ago)
    order_11 = create(:completed_order, user: @user_22, created_at: 10.days.ago, updated_at: 18.minutes.ago)
    order_12 = create(:completed_order, user: @user_22, created_at: 10.days.ago, updated_at: 1.minute.ago)
    create(:fulfilled_order_item, item: item_4, order: order_4, created_at: 1.minute.ago, updated_at: 18.minutes.ago)
    create(:fulfilled_order_item, item: item_8, order: order_11, created_at: 1.minute.ago, updated_at: 18.minutes.ago)
    create(:order_item, item: item_8, order: order_12, created_at: 1.minute.ago, updated_at: 1.minute.ago)

    item_9 = create(:item, user: @merchant_20)
    item_10 = create(:item, user: @merchant_20)
    order_5 = create(:completed_order, user: @user_23, created_at: 10.days.ago, updated_at: 17.minutes.ago)
    order_13 = create(:completed_order, user: @user_23, created_at: 10.days.ago, updated_at: 17.minutes.ago)
    order_14 = create(:completed_order, user: @user_19, created_at: 10.days.ago, updated_at: 1.minute.ago)
    create(:fulfilled_order_item, item: item_9, order: order_13, created_at: 10.days.ago, updated_at: 17.minutes.ago)
    create(:fulfilled_order_item, item: item_10, order: order_14, created_at: 10.days.ago, updated_at: 17.minutes.ago)

    item_11 = create(:item, user: @merchant_21)
    item_12 = create(:item, user: @merchant_21)
    order_6 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 16.minutes.ago)
    order_15 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 16.minutes.ago)
    order_16 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 10.days.ago)
    create(:fulfilled_order_item, item: item_11, order: order_15, created_at: 10.days.ago, updated_at: 16.minutes.ago)
    create(:fulfilled_order_item, item: item_12, order: order_16, created_at: 10.days.ago, updated_at: 16.minutes.ago)

    item_13 = create(:item, user: @merchant_22)
    item_14 = create(:item, user: @merchant_22)
    order_7 = create(:completed_order, user: @user_22, created_at: 10.days.ago, updated_at: 15.minutes.ago)
    order_17 = create(:completed_order, user: @user_22, created_at: 10.days.ago, updated_at: 15.minutes.ago)
    order_18 = create(:completed_order, user: @user_22, created_at: 10.days.ago, updated_at: 10.days.ago)
    create(:fulfilled_order_item, item: item_13, order: order_17, created_at: 10.days.ago, updated_at: 15.minutes.ago)
    create(:fulfilled_order_item, item: item_14, order: order_18, created_at: 10.days.ago, updated_at: 15.minutes.ago)

    item_15 = create(:item, user: @merchant_23)
    item_16 = create(:item, user: @merchant_23)
    order_8 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 14.minutes.ago)
    order_19 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 14.minutes.ago)
    order_20 = create(:completed_order, user: @user_21, created_at: 10.days.ago, updated_at: 14.minutes.ago)
    create(:fulfilled_order_item, item: item_15, order: order_19, created_at: 10.days.ago, updated_at: 14.minutes.ago)
    create(:fulfilled_order_item, item: item_16, order: order_20, created_at: 10.days.ago, updated_at: 14.minutes.ago)
  end
  it 'can see fastest merchants within current users state' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_21)
    visit merchants_path

    within '#statistics' do
      within '#top-5-merchants-fastest-fulfilled-instate' do
      expect(page).to have_content(@merchant_18.name, @merchant_19.name, @merchant_20.name, @merchant_21.name, @merchant_22.name)
      end
    end
  end
  it 'can see the fastest merchants within current users city' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_21)
    visit merchants_path

    within '#statistics' do
      within '#top-5-merchants-fastest-fulfilled-incity' do
      expect(page).to have_content(@merchant_18.name, @merchant_19.name, @merchant_20.name, @merchant_21.name, @merchant_22.name)
      end
    end
  end
end
