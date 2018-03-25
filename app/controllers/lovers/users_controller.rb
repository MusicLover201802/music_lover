class Lovers::UsersController < ApplicationController
  def show
  	@orders = Order.where(user_id: current_user.id)
  end

  def edit
  end

  def retire
	user = current_user
  user.update(retire_flag: true) ### リタイアフラグをtrueに更新
	user.soft_destroy ### 論理削除処理※soft_destroyはkakurenbo-putiの固有メソッド
	session.destroy ### 退会したらログアウトさせる
	redirect_to lovers_retire_path ### 言わずもがな遷移先
  end

  def update
  end


end
