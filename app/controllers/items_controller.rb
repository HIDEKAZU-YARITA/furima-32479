class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
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

  private

  def item_params
    params.permit(:image, :name, :introduction, :category_id, :condition_id, :charge_id, :prefecture_id, :preparation_day_id,
                  :price).merge(user_id: current_user.id)
  end
end
