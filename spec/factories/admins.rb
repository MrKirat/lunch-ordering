FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :with_ui_role do
      after(:create) do |admin|
        admin.add_role :ui
      end
    end
  end
end
