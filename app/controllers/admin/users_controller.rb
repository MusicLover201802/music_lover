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
    @orders = Order.where(user_id: params[:id]).page(params[:page]).per(4).reverse_order

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
    if@user.update(user_params)
    redirect_to admin_users_path, notice: "ユーザー情報の編集が完了しました"
    else
    render action: :edit
    end
  end

  def retire
    user = User.find(params[:id])
    user.update(retire_flag: true) ### リタイアフラグをtrueに更新
    user.soft_destroy ### 論理削除処理※soft_destroyはkakurenbo-putiの固有メソッド
    # session.destroy ### 退会したらログアウトさせる
    redirect_to admin_users_path ### 言わずもがな遷移先
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
