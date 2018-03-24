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

  def show
  end

  # 購入アクション③カートの中身を空にするアクション
  def cart_destroy
    @user = User.find(current_user.id)
    @user_items = @user.user_items
    @user_items.each do |user_items|  #カート中身を1レコードずつ削除していく
      user_items.destroy
    end
    redirect_to lovers_end_path
  end

  # カート画面から、カート内数量を→更新するアクション
  def update
    @new_order = UserItem.find_by(user_item_params)
    @new_order.update(quantity_params)
    @new_order.save
    redirect_to lovers_user_item_path(current_user.id)
  end

  # 商品詳細から、商品をカートに入れる
  def create
    @new_order = UserItem.new(add_item_params)
    @new_order.user_id = current_user.id
    @new_order.save
    redirect_to lovers_user_item_path(current_user.id)
  end

  # カート画面から、カートの中身を削除するアクション
  def destroy
    item = UserItem.find(params[:id])
    binding.pry
    item.destroy
    redirect_to lovers_user_item_path(current_user.id)
  end


private
  def user_item_params
    params.require(:user_item).permit(:id)
  end

  def quantity_params
    params.require(:user_item).permit(:quantity)
  end

  def add_item_params
    params.require(:user_item).permit(:quantity, :item_id)
  end

end
