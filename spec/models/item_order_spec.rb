require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: @user.id, item_id: @item.id)
  end
  context "購入がうまくできるとき" do
    it "tokenとdelivery情報とorder情報があれば購入ができること" do
      expect(@item_order).to be_valid
    end

    it "phone_numberにハイフンがなくても購入できること" do
      @item_order.phone_number = "09077777777"
      expect(@item_order).to be_valid
    end
  end
  context "購入がうまくできないとき" do
    it "postal_codeが空では購入できないこと" do
      @item_order.postal_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "area_idが空では購入できないこと" do
      @item_order.area_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Area can't be blank")
    end

    it "municipalityが空では購入できないこと" do
      @item_order.municipality = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Municipality can't be blank")
    end

    it "addressが空では購入できないこと" do
      @item_order.address = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では購入できないこと" do
      @item_order.phone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが12桁以上では購入できないこと" do
      @item_order.phone_number = '123456789123'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it "postal_codeにはハイフンがないと購入できないこと" do
      @item_order.postal_code = "1234567"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "tokenが空では登録できないこと" do
      @item_order.token = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
