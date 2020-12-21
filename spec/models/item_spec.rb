require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品登録' do
      context '商品登録がうまくいくとき' do
        it 'すべての項目が存在していれば保存できること' do
          expect(@item).to be_valid
        end

        it '商品名が漢字・かな・カナであれば保存できること' do
          @item.name = '漢字、かな、カナ。'
          expect(@item).to be_valid
        end

        it '商品名が英字・数字・記号であれば保存できること' do
          @item.name = 'item1234@,.'
          expect(@item).to be_valid
        end

        it '商品の説明が漢字・かな・カナであれば保存できること' do
          @item.introduction = '漢字、かな、カナ。'
          expect(@item).to be_valid
        end

        it '商品の説明が英字・数字・記号であれば保存できること' do
          @item.introduction = 'item1234@,.'
          expect(@item).to be_valid
        end

        it 'カテゴリーIDが1以上10以下であれば保存できること' do
          @item.category_id = 10
          expect(@item).to be_valid
        end

        it '商品の状態IDが1以上6以下であれば保存できること' do
          @item.condition_id = 6
          expect(@item).to be_valid
        end

        it '配送料の負担IDが1以上2以下であれば保存できること' do
          @item.charge_id = 2
          expect(@item).to be_valid
        end

        it '発送元の地域IDが1以上47以下であれば保存できること' do
          @item.prefecture_id = 47
          expect(@item).to be_valid
        end

        it '発送までの日数IDが1以上3以下であれば保存できること' do
          @item.preparation_day_id = 3
          expect(@item).to be_valid
        end

        it '価格が300円以上9,999,999円以下であれば保存できること' do
          @item.price = 1_000_000
          expect(@item).to be_valid
        end
      end

      context '商品登録がうまくいかないとき' do
        it 'イメージファイルがないと保存できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名がないと保存できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'カテゴリーIDがないと保存できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be selected.')
        end

        it '商品の状態IDがないと保存できないこと' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be selected.')
        end

        it '配送料の負担IDがないと保存できないこと' do
          @item.charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Charge must be selected.')
        end

        it '発送元の地域IDがないと保存できないこと' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be selected.')
        end

        it '発送までの日数IDがないと保存できないこと' do
          @item.preparation_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Preparation day must be selected.')
        end

        it '価格がないと保存できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格が300円未満であると保存できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of range.')
        end

        it '価格が10,000,000円以上であると保存できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of range.')
        end

        it '価格が全角であると保存できないこと' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of range.')
        end

        it 'ユーザーが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
