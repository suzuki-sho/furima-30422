class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :price, :description, :user, :category_id, :state_id, :shipping_id, :area_id, :days_id)
  end
end
