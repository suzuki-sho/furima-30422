class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]
  before_action :authenticate_user!, only: [:index, :new, :edit, :update]

  def index
    @item_order = ItemOrder.new
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  
  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:item_order).permit(:postal_code, :area_id, :municipality, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
