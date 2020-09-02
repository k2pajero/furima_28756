require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload(
        'public/images/スクリーンショット 2020-08-22 15.23.46.png'
      )
    end

    context '商品が保存できる場合' do
      it '画像・商品名・商品説明・カテゴリー情報・状態・配送料負担・発送元・発送日数・価格があれば商品は保存される' do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できない場合' do
      it '画像１枚がないと商品は保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと商品は保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がないと商品は保存できない' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'カテゴリーがないと商品は保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include(
          "Category can't be blank", 'Category is not a number'
        )
      end
      it '商品状態がないと商品は保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include(
          "Condition can't be blank", 'Condition is not a number'
        )
      end
      it '配送料負担がないと商品は保存できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include(
          "Delivery fee can't be blank", 'Delivery fee is not a number'
        )
      end
      it '配送までの日数がないと商品は保存できない' do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include(
          "Delivery days can't be blank", 'Delivery days is not a number'
        )
      end
      it '価格がないと商品は保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include(
          "Price can't be blank", 'Price 半角数字を使用してください', 'Price is not a number'
        )
      end
      it '価格が¥300以上でないと商品は保存できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include(
          'Price must be greater than or equal to 300'
        )
      end
      it '価格が¥9,999,999以下でないと商品は保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include(
          'Price must be less than or equal to 9999999'
        )
      end
      it '価格が半角数字でないと商品は保存できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
