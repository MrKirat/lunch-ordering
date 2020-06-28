FactoryBot.define do
  factory :food_item, class: 'Food::Item' do
    sequence(:name) { |n| "Food item no.#{n}" }
    sequence(:price_cents) { |n| n * 100 }
  end
end
