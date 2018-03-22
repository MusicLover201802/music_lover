# 開発中。アクション名は仮です。最終的にコントローラーを分ける可能性もあります
class Lovers::UserItemsController < ApplicationController
before_action :get_current_cart

  def check #進捗確認用　開発終了したら削除します
    @order_items = OrderItem.all
    @orders = Order.all
    @items = Item.all
  end

  # カートの中身全取得 → @user_items変数に格納
  def get_current_cart
    @user = User.find(current_user.id)
    @user_items = UserItem.where(user_id: current_user.id)
  end

  #購入確定→購入アクション①注文数に応じて在庫を減らすアクション
  def cart_stock
    @user_items.each do |user_items| #1レコードごとに、itemsテーブルのstockカラム - カートの中の数量 を実行し、save
    user_items.item.stock -= user_items.quantity
    user_items.item.save
    end
    redirect_to lovers_user_items_cart_destroy_path
  end

  #購入アクション②カートの中身を空にするアクション
  def cart_destroy
    @user = User.find(current_user.id)
    @user_items = @user.user_items
    @user_items.each do |user_items|  #カート中身を1レコードずつ削除していく
      user_items.destroy
    end
    redirect_to lovers_end_path
  end

  # カートの中身を更新するアクション:id1のものしか更新できないのが課題
  def update
    item = UserItem.find(params[:id])
    item.update(quantity_params)
    item.save
    redirect_to lovers_user_item_path(current_user.id)
  end

  # カートの中身を新規に生成するアクション 作成中
  def create
    @new_order = UserItem.new(add_item_params)
    @new_order.user_id = current_user.id
    # binding.pry
    @new_order.save
    redirect_to lovers_user_item_path(current_user.id)
  end


  def show
  end


private

  # def user_item_params
  #   params.require(:user_item).permit(:id)
  # end

  def quantity_params
    params.require(:user_item).permit(:quantity)
  end

  def add_item_params
    params.require(:user_item).permit(:quantity, :item_id)
  end

end
