FactoryBot.define do

  factory :degu do
    name { Faker::Pokemon.name }
    gender { [:male, :female].sample }
    birthday { Faker::Date.between(2.years.ago, Date.today)}

    after(:build) do |degu|
      degu.come_date = Faker::Date.between(degu.birthday, Date.today)
    end

    trait(:invalid) do
      leave_date Date.today
    end
  end

end
