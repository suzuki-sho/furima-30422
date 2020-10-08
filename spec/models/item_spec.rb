require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録がうまくいかないとき' do
    it "titleが空だと登録できない" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "descriptionが空だと登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "state_idが空だと登録できない" do
      @item.state_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it "shipping_idが空だと登録できない" do
      @item.shipping_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end
    it "area_idが空だと登録できない" do
      @item.area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it "day_idが空だと登録できない" do
      @item.day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが￥300未満だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが￥10000000以上だと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
    it "priceが半角数字でないと登録できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
