require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "FactoryBotで設定したカラムの情報が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）で登録できる" do
        @user.first_name = "ムサシ川村という"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end 
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "パスワードは、半角英文字だけでは登録できない" do
        @user.password = "eeeEEE"
        @user.password_confirmation = "eeeEEE"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードは、数字だけでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "f_name_kanaが空だと登録できない" do
        @user.f_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana can't be blank", "F name kana is invalid")
      end
      it "l_name_kanaが空だと登録できない" do
        @user.l_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana can't be blank", "L name kana is invalid")
      end
      it "f_name_kanaがカタカナでないと登録できない" do
        @user.f_name_kana = "佐々木"
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana is invalid")
      end
      it "l_name_kanaがカタカナでないと登録できない" do
        @user.l_name_kana = "koziro"
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end   
  end
end
