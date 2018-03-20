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


  # 購入履歴を保存する処理　送り先をデフォルトにしない場合の設定はこれからです
  def create
      @neworder = Order.new(order_params)
      @neworder.user_id = current_user.id

        @neworder.last_name = @user.last_name
        @neworder.first_name = @user.first_name
        @neworder.last_name_kana = @user.last_name_kana
        @neworder.first_name_kana = @user.first_name_kana
        @neworder.postal_code = @user.postal_code
        @neworder.prefecture = @user.prefecture
        @neworder.city = @user.city
        @neworder.phone_number = @user.phone_number

      @neworder.save
  end

  # 購入明細を保存する処理
  # order_idは、カレントユーザーの直近の注文idを取ってくるよう設定しました
  # 流れ：①過去の注文履歴（Orders)を新しい順に並べ→②カレントユーザーの注文1件を抜き出し→③そのorder_idをOrderItemに渡しています
  def orderitems_save
    past_order = Order.order("created_at DESC").find_by(user_id: current_user.id)
    @user_items.each do |user_items| # カートの中身1レコードごとにorder_itemsテーブルのインスタンスをnew → save
      @neworderitem = OrderItem.new(item_id: user_items.item_id, quantity: user_items.quantity, price: user_items.item.price, order_id: past_order.id)
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
    @orders = Order.all
  end

  def show
  end


  def update
  end


  private
  def order_params
    params.require(:order).permit(:payment, :user_id)
  end


end
