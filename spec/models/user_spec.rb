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
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '1qazxs'
        @user.password_confirmation = '1qazxs'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1qazx'
        @user.password_confirmation = '1qazx'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数文字を使用してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'real_family_nameが空だと登録できない' do
        @user.real_family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Real family name can't be blank", 'Real family name 全角文字を使用してください'
        )
      end
      it 'real_family_nameが全角でないと登録できない' do
        @user.real_family_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Real family name 全角文字を使用してください')
      end
      it 'real_first_nameが空だと登録できない' do
        @user.real_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Real first name can't be blank", 'Real first name 全角文字を使用してください'
        )
      end
      it 'real_first_nameが全角でないと登録できない' do
        @user.real_first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Real first name 全角文字を使用してください')
      end
      it 'reading_family_nameが空だと登録できない' do
        @user.reading_family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Reading family name can't be blank", 'Reading family name 全角カタカナ文字を使用してください'
        )
      end
      it 'reading_family_nameが全角カタカナでないと登録できない' do
        @user.reading_family_name = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading family name 全角カタカナ文字を使用してください')
      end
      it 'reading_first_nameが空だと登録できない' do
        @user.reading_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Reading first name can't be blank", 'Reading first name 全角カタカナ文字を使用してください'
        )
      end
      it 'reading_first_nameが全角カタカナでないと登録できない' do
        @user.reading_first_name = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading first name 全角カタカナ文字を使用してください')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
