class Lovers::OrdersController < ApplicationController
# アクション名は仮です

	# 購入確認ページ表示:リダイレクト元を取得し、どこから遷移してきたかによって
	# ビューページに渡す送り先情報を切り替えている
	def new
		@neworder = Order.new
		path = Rails.application.routes.recognize_path(request.referer)

		if session[:create] == "create"
			session[:create] = nil
			new_destination = Destination.order("created_at DESC").find_by(user_id: current_user.id)
			@neworder.last_name = new_destination.last_name
			@neworder.first_name =  new_destination.first_name
			@neworder.last_name_kana =  new_destination.last_name_kana
			@neworder.first_name_kana =  new_destination.first_name_kana
			@neworder.postal_code =  new_destination.postal_code
			@neworder.prefecture =  new_destination.prefecture
			@neworder.city =  new_destination.city
			@neworder.building =  new_destination.building
			@neworder.phone_number =  new_destination.phone_number

		elsif path[:controller] == 'lovers/destinations' && path[:action] == 'new'
			d = Destination.find_by(id: params[:id])
			@neworder.last_name = d.last_name
			@neworder.first_name = d.first_name
			@neworder.last_name_kana = d.last_name_kana
			@neworder.first_name_kana = d.first_name_kana
			@neworder.postal_code = d.postal_code
			@neworder.prefecture = d.prefecture
			@neworder.city = d.city
			@neworder.building = d.building
			@neworder.phone_number = d.phone_number

		else
			@user = User.find(current_user.id)
			@neworder.last_name = @user.last_name
			@neworder.first_name = @user.first_name
			@neworder.last_name_kana = @user.last_name_kana
			@neworder.first_name_kana = @user.first_name_kana
			@neworder.postal_code = @user.postal_code
			@neworder.prefecture = @user.prefecture
			@neworder.city = @user.city
			@neworder.building = @user.building
			@neworder.phone_number = @user.phone_number

		end

		@user = User.find(current_user.id)
		@user_items = @user.user_items
	end


	def show
		@order = Order.find(params[:id])
	end


	# 購入履歴(Orders)を保存する処理
	def create
	    @neworder = Order.new(order_params)
	    @neworder.user_id = current_user.id
	    @neworder.save
	    redirect_to lovers_orders_orderitems_save_path
	end

	# 購入明細(Order_items)を保存する処理
	# order_idは、カレントユーザーの直近の注文idを取ってくるよう設定しました
	# 流れ：①過去の注文履歴（Orders)を新しい順に並べ→②カレントユーザーの注文1件を抜き出し→③そのorder_idをOrderItemに渡しています
	def orderitems_save
	 	@user_items = UserItem.where(user_id: current_user.id)
	    past_order = Order.order("created_at DESC").find_by(user_id: current_user.id)
	    @user_items.each do |user_items| # カートの中身1レコードごとにorder_itemsテーブルのインスタンスをnew → save
	    	@neworderitem = OrderItem.new(item_id: user_items.item_id,
	    								  quantity: user_items.quantity,
	    								  price: user_items.item.price,
	    								  order_id: past_order.id)
	    	@neworderitem.save
	    end
	  	redirect_to lovers_user_items_cart_stock_path
	end


  private
	def order_params
		params.require(:order).permit(:last_name,
									  :first_name,
									  :last_name_kana,
									  :first_name_kana,
									  :postal_code,
									  :prefecture,
									  :city,
									  :building,
									  :phone_number,
									  :payment,
									  :user_id)
	end

end


