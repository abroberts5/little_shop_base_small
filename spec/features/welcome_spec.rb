require 'rails_helper'

RSpec.describe 'Welcome page', type: :feature do
  it 'displays a simple welcome message' do
    visit root_path
    expect(page).to have_content("Welcome to this ficticious 'Little Shop' e-commerce platform.")
  end
end
