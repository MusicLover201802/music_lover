# 開発中。アクション名は仮です。最終的にコントローラーを分ける可能性もあります
class Lovers::UserItemsController < ApplicationController
before_action :get_current_cart

  # カートの中身全取得 → @user_items変数に格納
  def get_current_cart
    @user = User.find(current_user.id)
    @user_items = @user.user_items
  end


  #注文数に応じて在庫を減らすアクション
  def cart_stock
    @user_items.each do |user_items| #1レコードごとに、itemsテーブルのstockカラム - カートの中の数量 を実行し、save
    user_items.item.stock -= user_items.quantity
    user_items.item.save
    end
    redirect_to lovers_end_path
  end


  # 購入履歴を保存する処理　これから開発します
  def order_save
    @user_items.each do |user_items|
      @neworder = Order.new
      @neworder = user_items
      @neworder.save
    end
  end

  # 購入明細を保存する処理　order_idをどう割り当てるか要検討
  def orderitems_save
    @user_items.each do |user_items| # カートの中身1レコードごとにorder_itemsテーブルのインスタンスをnew → save
      @neworderitem = OrderItem.new(item_id: user_items.item_id, quantity: user_items.quantity, price: user_items.item.price, order_id: 7)
      @neworderitem.save
    end
  redirect_to lovers_end_path
  end

  #カートの中身を空にするアクション
  def cart_destroy
    @user_items.each do |user_items|  #カート中身を1レコードずつ削除していく
      user_items.destroy
    end
    redirect_to lovers_end_path
  end

  def check #進捗確認用　開発終了したら削除します
    @order_items = OrderItem.all
  end

  def show
  end


  def update
  end


end
