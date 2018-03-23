class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(5)
  end

   def create
    @order = Order.new(order_params)
    @order.save
    redirect_to admin_orders_path
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
      order = Order.find(params[:id])
      order.update(order_params)
      redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:last_name_kana, 
                                  :first_name_kana, 
                                  :created_at, 
                                  :status, 
                                  :payment, 
                                  :postal_code, 
                                  :prefecture, 
                                  :city, 
                                  :building, 
                                  :phone_number, 
                                  order_items_attributes: [:id, 
                                               :item_id, 
                                               :quantity, 
                                               :price, 
                                               :order_id]
      )
  end
end