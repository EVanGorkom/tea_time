FactoryBot.define do
  factory :tea do
    title { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    temperature { 100 }
    brew_time { 5 }
  end
end
