class Lovers::UserItemsController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@user_items = @user.user_items
  end

  def method
    @user = User.find(current_user.id)
    @user_items = @user.user_items

  end


  def cart_stock
    # カートの中身全取得
    @user = User.find(current_user.id)
    @user_items = @user.user_items

    # 在庫減らす処理 実装できた
    @user_items.each do |user_items|
    user_items.item.stock -= user_items.quantity
    user_items.item.save
    end
    redirect_to lovers_end_path

  end


  def cart_save
    # カートの中身全取得
    @user = User.find(current_user.id)
    @user_items = @user.user_items

    # カート中身を一つずつ削除するアクション
    @user_items.each do |user_items|
      user_items.destroy
    end

    redirect_to lovers_end_path

    購入履歴を保存する処理
    @user_items.each do |user_items|
      @neworder = Order.new
      @neworder = user_items
      @neworder.save

  end
    # カートの中身を全取得する find_by(カートid)
    #   each文内で
    #     在庫を減らす count -= （マイナスになったら？ゼロになったら？）
    #     履歴保存.id

  def destroy
    user_items = UserItem.find(params[:id])
    user_items.destroy
    redirect_to lovers_end_path
  end

  def update
  end

end
