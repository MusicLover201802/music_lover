class Admin::UsersController < ApplicationController

  def index
    # @users = User.all.reverse_order
    @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_users_path
  end

  def retire
  end

private
  def user_params
    params.require(:user).permit(
      :email,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postal_code,
      :prefecture,
      :city,
      :building,
      :phone_number,
      )
  end

end
