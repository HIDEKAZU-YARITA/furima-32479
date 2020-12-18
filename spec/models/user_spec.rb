require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "すべての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailの途中に@があると登録ができる" do
        @user.email = "a@b"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "Abc123"
        @user.password_confirmation = "Abc123"
        expect(@user).to be_valid
      end
      it "姓は漢字で登録できる" do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end
      it "姓はかなで登録できる" do
        @user.last_name = "やまだ"
        expect(@user).to be_valid
      end
      it "姓はカナで登録できる" do
        @user.last_name = "ヤマダ"
        expect(@user).to be_valid
      end
      it "名は漢字で登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "名はかなで登録できる" do
        @user.first_name = "たろう"
        expect(@user).to be_valid
      end
      it "名はカナで登録できる" do
        @user.first_name = "タロウ"
        expect(@user).to be_valid
      end
      it "姓(カナ)はカナで登録できる" do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "名(カナ)はカナで登録できる" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がないと登録できない" do
        @user.email = 'ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailの最初に@があると登録できない" do
        @user.email = '@ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailの最後に@があると登録できない" do
        @user.email = 'ab@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid.")
      end
      it "passwordが英字だけでは登録できない" do
        @user.password = 'AbCdEf'
        @user.password_confirmation = 'AbCdEf'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid.")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = 'Abc12'
        @user.password_confirmation = 'Abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = 'Abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = 'Abc123'
        @user.password_confirmation = 'Def456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "姓が空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "姓が半角文字では登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "名が空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名が半角文字では登録できない" do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "姓(カナ)が空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "姓(カナ)が半角文字では登録できない" do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "姓(カナ)が漢字では登録できない" do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "姓(カナ)がかなでは登録できない" do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "名(カナ)が空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名(カナ)が半角文字では登録できない" do
        @user.first_name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "名(カナ)が漢字では登録できない" do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "名(カナ)がカナでは登録できない" do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "生年月日が年だけでは登録できない" do
        @user.birthday = '1930'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "生年月日が月日だけでは登録できない" do
        @user.birthday = '01/01'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
