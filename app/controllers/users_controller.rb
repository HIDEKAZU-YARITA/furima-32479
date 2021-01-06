class UsersController < ApplicationController
  before_action :move_to_index, only: :show
  
  def show
  end

  private

  def move_to_index
    if user_signed_in?
      @user = User.find(params[:id])
      redirect_to root_path unless @user.id == current_user.id
    else
      redirect_to root_path
    end
  end
end
