class Admin::UsersController < ApplicationController

      before_action :authenticate_admin!

  def index
    #@users = User.page(params[:page]).per(5).reverse_order
            ### 検索用 ###
    @search = User.ransack(params[:q])
    @selects = @search.result.page(params[:page]).per(5).reverse_order
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
    redirect_to admin_users_path
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
      :retire_flag,
      )
  end

end
