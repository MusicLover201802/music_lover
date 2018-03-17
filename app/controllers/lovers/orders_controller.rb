class Lovers::OrdersController < ApplicationController
	def new
		@user = User.find(current_user.id)
		@user_items = @user.user_items
		@neworder = Order.new
		@neworder.save
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		@neworder = Order.new(order_params)
		@neworder.save
		@neworderitem = OrderItem.new(order_item_params)
		@neworderitem.save
		redirect_to controller: 'user_items', action: 'destroy', id: current_user.id
	end

  private
	def order_params
		params.require(:order).permit(:)
	end

end


