FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { 3 }
    frequency { 3 }
    customer_id { 1 }
    status { Faker::Subscription.status }
  end
end
