require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとpasswordとpassword_confirmationとfamily_nameとfamily_name_kanaとfirst_nameとfirst_name_kanaとbirthdayが存在すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない'do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it '重複したemailでは登録できない' do
      end
      it 'passwordが５文字以下では登録できない' do
      end
      it 'family_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'family_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end
end
