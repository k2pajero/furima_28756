FactoryBot.define do
  factory :order_delivery do
    postal_code   { '000-0000' }
    prefecture_id { '2' }
    city          { '川崎市' }
    address       { '川崎区生田３丁目' }
    building_name { 'メゾンドイクタ１０１' }
    tell          { '09012345678' }
    token         { 'aaaaa' }
  end
end
