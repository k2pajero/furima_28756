FactoryBot.define do
  factory :item do
    # user_id           { "1" }
    name              { '商品名' }
    content           { '説明文' }
    condition_id      { '2' }
    prefecture_id     { '2' }
    category_id       { '2' }
    delivery_fee_id   { '2' }
    delivery_days_id  { '2' }
    price             { '1000' }
    # association :user
  end
end
