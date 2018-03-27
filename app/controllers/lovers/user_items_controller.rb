# 開発中。アクション名は仮です。最終的にコントローラーを分ける可能性もあります
class Lovers::UserItemsController < ApplicationController

before_action :authenticate_user!
before_action :get_current_cart!

  def check #進捗確認用　開発終了したら削除します
    @order_items = OrderItem.all
    @orders = Order.all
    @items = Item.all
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
    redirect_to lovers_user_item_path(current_user)
  end

  # カート画面から、カート内数量を→更新するアクション
  def update
    @user_items = UserItem.find_by(user_item_params)
    @user_items.update(quantity_params)
    @user_items.save
    redirect_to lovers_user_item_path(current_user.id), notice: '数量を変更しました'
  end

  # 商品詳細から、商品をカートに入れる
  # さの修正
  def create

    # binding.pry
    item_id = params[:user_item][:item_id].to_i
    if @user_items.find_by(item_id: item_id).blank?

    @user_items = UserItem.new(add_item_params)
    @user_items.user_id = current_user.id
    @user_items.save

    else
      # binding.pry
    @user_item = @user_items.find_by(item_id: item_id)
    @user_item.quantity += params[:user_item][:quantity].to_i
    @user_item.user_id = current_user.id
    @user_item.save
  end


    redirect_to lovers_user_item_path(current_user.id)
  end

  # カート画面から、カートの中身を削除するアクション
  def destroy
    item = UserItem.find(params[:id])
    # binding.pry
    item.destroy
    redirect_to lovers_user_item_path(current_user.id), notice: '商品を取り消しました'
  end


private
  def user_item_params
    params.require(:user_item).permit(:id)
  end

  def quantity_params
    params.require(:user_item).permit(:quantity)
  end

  def add_item_params
    params.require(:user_item).permit(:quantity, :item_id,)
  end

  # カートの中身全取得 → @user_items変数に格納
  def get_current_cart!
    @user = User.find(current_user.id)
    @user_items = UserItem.where(user_id: current_user.id)
  end

end
