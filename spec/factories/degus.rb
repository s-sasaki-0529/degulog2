FactoryBot.define do

  factory :degu do
    name { Faker::Pokemon.name }
    gender { [:male, :female].sample }
    birthday { Faker::Date.between(2.years.ago, Date.today)}
    come_date Date.today
  end

end
