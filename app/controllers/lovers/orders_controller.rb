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
end
