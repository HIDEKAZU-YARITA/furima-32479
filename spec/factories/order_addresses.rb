FactoryBot.define do
  factory :order_address do
    post_number           { '100-0001' }
    prefecture_id         { 13 }
    city                  { "千代田区" }
    house_number          { "千代田1-1-1" }
    building_name         { '東京ビル' }
    phone_number          { '0333333333' }
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
