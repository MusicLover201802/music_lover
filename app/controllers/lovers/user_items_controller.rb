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


  def cart_destroy
    # カートの中身全取得
    @user = User.find(current_user.id)
    @user_items = @user.user_items

    # カート中身を一つずつ削除するアクション
    @user_items.each do |user_items|
      user_items.destroy
    end
    redirect_to lovers_end_path
  end


  def order_save
    # 購入履歴を保存する処理
    @user_items.each do |user_items|
    @neworder = Order.new
    @neworder = user_items
    @neworder.save
  end
end

  def orderitems_save
  # 購入明細を保存する処理
    redirect_to lovers_end_path
  
  end


    def destroy
      user_items = UserItem.find(params[:id])
      user_items.destroy
      redirect_to lovers_end_path
    end

    def update
    end

  end
