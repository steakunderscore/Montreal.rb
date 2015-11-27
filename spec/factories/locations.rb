FactoryGirl.define do
  factory :location do
    name    { Faker::Company.name           }
    address { Faker::Address.street_address }
    url     { Faker::Internet.url           }
  end
end
