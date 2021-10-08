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
      it 'passwordとpassword_confirmationが英数混合６文字以上ならば登録できる' do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない'do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it '@の含まないemailは登録できない' do
        @user.email = "aaawww"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "123qwe"
        @user.password_confirmation = "123poi"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = "1q2w3"
        @user.password_confirmation = "1q2w3"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが全角では登録できない' do
        @user.password = "０９８PLM"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'family_nameが漢字、ひらがな、カタカナ以外では登録できない' do
        @user.family_name = "!"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it 'first_nameが漢字、ひらがな、カタカナ以外では登録できない' do
        @user.first_name = "?"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジを入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエを入力してください")
      end
      it 'family_name_kanaがカタカナ以外であれば登録できない' do
        @user.family_name_kana = "ごうだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジは不正な値です")
      end
      it 'first_name_kanaがカタカナ以外であれば登録できない' do
        @user.first_name_kana = "たけし"
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエは不正な値です")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
