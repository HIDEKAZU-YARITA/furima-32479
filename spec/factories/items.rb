FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.sentence }
    introduction        { Faker::Lorem.sentence }
    category_id         { 1 }
    condition_id        { 1 }
    charge_id           { 1 }
    prefecture_id       { 13 }
    preparation_day_id  { 1 }
    price               { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
