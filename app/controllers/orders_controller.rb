class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id).merge(item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if @item.user.id == current_user.id || Order.where(item_id: @item.id).exists?
  end

end
