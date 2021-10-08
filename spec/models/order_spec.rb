require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it '郵便番号と都道府県と市町村と番地と建物名と電話番号とトークンがあれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end
    context '商品購入できないとき' do
      it '郵便番号がなくては購入できない' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンが入っていなければ購入できない' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号がアルファベットでは購入できない' do
        @order.postal_code = "aaa-aaaa"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号が全角では購入できない' do
        @order.postal_code = "１２３-４５６７"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が選択されていなければ購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県が選択されていません")
      end
      it '市町村が空では購入できない' do
        @order.municipalities = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では購入できない' do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では購入できない' do
        @order.telephone = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が全角では購入できない' do
        @order.telephone = "０７０１２３４５６７８"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号がアルファベットでは購入できない' do
        @order.telephone = "qawsedrftgy"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が９桁以下では購入できない' do
        @order.telephone = "070123456"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上では購入できない' do
        @order.telephone = "012345678912"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'トークンが空では購入できない' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'user_idが空だと登録できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
