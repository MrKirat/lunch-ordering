FactoryBot.define do
  factory :order do

    transient do
      items_count { 5 }
    end

    before(:create) do |order, evaluator|
      order.food_items = create_list(:food_item, evaluator.items_count)
    end
  end
end
