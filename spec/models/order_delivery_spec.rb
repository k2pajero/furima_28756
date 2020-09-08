require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品の購入' do
    before do
      @order_delivery = FactoryBot.build(:order_delivery)
    end
    context '商品が購入できる場合' do
      it 'トークン、郵便番号、都道府県、市区町村、番地、電話番号があれば商品は購入できる' do
        expect(@order_delivery).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空だと登録できない' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @order_delivery.postal_code = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it '郵便番号にハイフン「-」が無いと登録できない' do
        @order_delivery.postal_code = '0000000'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が6桁以下だと登録できない' do
        @order_delivery.postal_code = '000000'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が8桁以上だと登録できない' do
        @order_delivery.postal_code = '00000000'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が未選択では登録できない' do
        @order_delivery.prefecture_id = 0
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '市区町村が空では登録できない' do
        @order_delivery.city = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @order_delivery.address = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_delivery.tell = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tell can't be blank", 'Tell 半角数字で入力してください。「-」は不要です')
      end
      it '電話番号にハイフン「-」があると登録できない' do
        @order_delivery.tell = '090-1234-5678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include(
          'Tell 半角数字で入力してください。「-」は不要です', 'Tell is too long (maximum is 11 characters)'
        )
      end
      it '電話番号が11桁以上あると登録できない' do
        @order_delivery.tell = '090123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Tell is too long (maximum is 11 characters)')
      end
    end
  end
end
