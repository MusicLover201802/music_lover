class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: params[:id]).order("created_at").reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
    redirect_to admin_users_path, notice: "ユーザー情報の編集が完了しました"
    else
    render action: :edit
    end
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
