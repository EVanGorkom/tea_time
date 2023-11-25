FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { 1 }
    frequency { 1 }
    customer_id { 1 }
    status { "MyString" }
  end
end
