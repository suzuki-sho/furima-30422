class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  berore_action :set_item, only: [:show, :edit, :update]
 
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless user_signed_in? && @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :price, :description, :category_id, :state_id, :shipping_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
