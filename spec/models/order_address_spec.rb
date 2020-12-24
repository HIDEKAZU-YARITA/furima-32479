require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '購入登録' do
      context '購入登録がうまくいくとき' do
        it 'すべての項目が存在していれば保存できること' do
          expect(@order_address).to be_valid
        end

        it '建物名が存在していなくても保存できること' do
          @order_address.building_name = nil
          expect(@order_address).to be_valid
        end
      end

      context '購入登録がうまくいかないとき' do
        it '郵便番号が入力されてないと保存できないこと' do
          @order_address.post_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post number can't be blank")
        end

        it '郵便番号にハイフンが入力されてないと保存できないこと' do
          @order_address.post_number = '1000001'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
        end

        it '郵便番号のハイフンが4番目に入力されてないと保存できないこと' do
          @order_address.post_number = '1000-001'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
        end

        it '郵便番号のハイフンが4番目に入力されているが後半が4桁未満で入力されていると保存できないこと' do
          @order_address.post_number = '100-001'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
        end

        it '郵便番号のハイフンが4番目に入力されているが後半が5桁以上で入力されていると保存できないこと' do
          @order_address.post_number = '100-00001'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
        end

        it '郵便番号に全角文字が入力されていると保存できないこと' do
          @order_address.post_number = '１００−０００１'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
        end

        it '都道府県が選択されていないと保存できないこと' do
          @order_address.prefecture_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture must be selected.")
        end

        it '市区町村が入力されていないと保存できないこと' do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it '番地が入力されていないと保存できないこと' do
          @order_address.house_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end

        it '電話番号が入力されていないと保存できないこと' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号にハイフンが入力されていると保存できないこと' do
          @order_address.phone_number = '03-3333-3333'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
        end

        it '電話番号が9桁以下で入力されていると保存できないこと' do
          @order_address.phone_number = '012345678'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
        end

        it '電話番号が12桁以上で入力されていると保存できないこと' do
          @order_address.phone_number = '012345678901'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
        end

        it '電話番号に全角文字が入力されていると保存できないこと' do
          @order_address.phone_number = '０１２３４５６７８９'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
        end
        it 'トークンないと保存できないこと' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
