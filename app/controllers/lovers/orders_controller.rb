class Lovers::OrdersController < ApplicationController

	def new
		@neworder = Order.new
		path = Rails.application.routes.recognize_path(request.referer)

			if session[:create] == "create"#path[:controller] == 'lovers/destinations' && path[:action] == 'create'
				session[:create] = nil
				@neworder.last_name = '新規送り先を登録時　仮表示'
				@neworder.first_name = 'test'
				@neworder.last_name_kana = 'test'
				@neworder.first_name_kana = 'test'
				@neworder.postal_code = 'test'
				@neworder.prefecture = 'test'
				@neworder.city = 'test'
				@neworder.building = 'test'
				@neworder.phone_number = 'test'

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

	def create
		@neworder = Order.new
		@neworder.save
		@neworderitem = OrderItem.new(order_item_params)
		@neworderitem.save
		redirect_to controller: 'user_items', action: 'destroy', id: current_user.id
	end


end


