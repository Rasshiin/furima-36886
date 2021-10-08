require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できる時' do
      it '画像、商品名、説明、価格、カテゴリー、商品の状態、送料の負担、発送元の地域、発送までの日数があれば出品できる' do
        expect(@item).to be_valid
      end
      it '金額が300円〜9999999円までなら出品できる(最小)' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '金額が300円〜9999999円までなら出品できる(最大)' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品名が空では出品できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '説明がなければ出品できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '価格がなければ出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it '価格が300円未満であれば出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300以上の値にしてください")
      end
      it '価格が9999999円を超えているなら出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は9999999以下の値にしてください")
      end
      it '価格が全角数字では保存できない' do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it '価格は英字では保存できない' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it 'カテゴリーが選択されていなければ出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーが選択されていません")
      end
      it '商品の状態が選択されていなければ出品できない' do
        @item.items_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態が選択されていません")
      end
      it '送料の負担が選択されていなければ出品できない' do
        @item.postage_load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担が選択されていません")
      end
      it '発送元の地域が選択されていなければ出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県が選択されていません")
      end
      it '発送までの日数が選択されていなければ出品できない' do
        @item.shipment_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数が選択されていません")
      end
      it '画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の画像を入力してください")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
