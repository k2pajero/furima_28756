require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload(
        "public/images/スクリーンショット 2020-08-22 15.23.46.png")
      end
  
    context "商品が保存できる場合" do
      it "画像・商品名・商品説明・カテゴリー情報・状態・配送料負担・発送元・発送日数・価格があれば商品は保存される" do
        expect(@item).to be_valid
      end
    end

    context "商品が保存できない場合" do
      it "画像１枚がないと商品は保存できない" do
      end     
      it "商品名がないと商品は保存できない" do
      end     
      it "商品説明がないと商品は保存できない" do
      end     
      it "カテゴリーがないと商品は保存できない" do
      end     
      it "商品状態がないと商品は保存できない" do
      end     
      it "配送料負担がないと商品は保存できない" do
      end     
      it "配送までの日数がないと商品は保存できない" do
      end     
      it "価格がないと商品は保存できない" do
      end     
      it "価格が¥300~¥9,999,999の間でないと商品は保存できない" do
      end     
      it "価格が半角数字でないと商品は保存できない" do
      end     
      
    end
  end
end
