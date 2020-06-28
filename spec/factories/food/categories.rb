FactoryBot.define do
  factory :food_category, class: 'Food::Category' do
    sequence(:name) { |n| "Food category no.#{n}" }

    transient do
      items_count { 5 }
      items { Food::Items.none }
    end

    before(:create) do |category, evaluator|
      category.items = create_list(:food_item, evaluator.items_count)
    end

    after(:create) do |category|
      category.items.each { |item| item.category = category }
    end
  end
end
