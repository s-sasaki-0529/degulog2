FactoryBot.define do

  factory :degu do
    sequence(:name) { |n| "TEST_NAME_#{n}" }
    gender 'male'
    birthday '2017-01-01'
    come_date '2017-01-01'

    trait :female do
      gender 'female'
    end
  end

end
