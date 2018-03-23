class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(5)
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    @order.save
    redirect_to admin_orders_path
  end

  def create
  end

  def update
      order = Order.find(params[:id])
      order.update(post_params)
      redirect_to admin_orders_path
  end

  private

  def post_params
    params.require(:order).permit(:last_name_kana, :first_name_kana, :created_at, :status, :payment, :postal_code, :prefecture, :city, :building, :phone_number)
  end
end