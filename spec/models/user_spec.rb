require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、ユーザー本名の名字と名前、
      ユーザー本名フリガナの名字と名前、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "1qazxs"
        @user.password_confirmation = "1qazxs"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
        # @user.password = "1qazxs"
        # @user.password_confirmation = "1qazx"
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でないと登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end

      it "real_family_nameが空だと登録できない" do
      end
      it "real_family_nameが全角でないと登録できない" do
      end

      it "real_first_nameが空だと登録できない" do
      end
      it "real_first_nameが全角でないと登録できない" do
      end

      it "reading_family_nameが空だと登録できない" do
      end
      it "reading_family_nameが全角カタカナでないと登録できない" do
      end

      it "reading_first_nameが空だと登録できない" do
      end
      it "reading_first_nameが全角カタカナでないと登録できない" do
      end

      it "birthdayが空だと登録できない" do
      end

    end
  end

end
