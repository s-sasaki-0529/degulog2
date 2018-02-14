FactoryBot.define do

  factory :measurement do
    date { Faker::Date.between(1.years.ago, Date.today) }
  end

end
