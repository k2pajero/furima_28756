require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品の購入' do
    before do
      @order_delovery = FactoryBot.build(:order_delivery)
    end
    context '商品が購入できる場合' do
      it 'トークン、郵便番号、都道府県、市区町村、番地、電話番号があれば商品は購入できる' do
      end
    end

    context '商品が購入できない場合' do
      it "tokenが空だと登録できない" do
      end
      it "郵便番号が空では登録できない" do
      end
      it "郵便番号にハイフン「-」が無いと登録できない" do
      end
      it "都道府県が空では登録できない" do
      end
      it "市区町村が空では登録できない" do
      end
      it "番地が空では登録できない" do
      end
      it "電話番号が空では登録できない" do
      end
      it "電話番号にハイフン「-」があると登録できない" do
      end
      it "電話番号が11桁以上あると登録できない" do
      end
    end
  end
end
