FactoryBot.define do
  factory :food_menu, class: 'Food::Menu' do
    transient do
      items_per_category { 5 }
      categories_count { 3 }
      categories { Food::Category.none }
    end

    before(:create) do |menu, evaluator|
      menu.categories = create_list(:food_category, evaluator.categories_count, items_count: evaluator.items_per_category)
    end

    after(:create) do |menu|
      menu.categories.each { |item| item.menu = menu }
    end
  end
end
