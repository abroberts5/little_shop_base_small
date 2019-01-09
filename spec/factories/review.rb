FactoryBot.define do
  factory :review do
    association :user, factory: :user
    association :item, factory: :item
    sequence(:title) { |n| "title_#{n}"}
    sequence(:description) { |n| "description_#{n}"}
    sequence(:rating) { rand(1..5) }
  end
end
