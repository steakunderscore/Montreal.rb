FactoryGirl.define do
  factory :event do
    starts_at { Faker::Time.between(2.years.ago, Time.now, :all) }
  end
end
