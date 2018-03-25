class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(5).reverse_order

        ### 検索用 ###
    @search = Order.ransack(params[:q])
    @selects = @search.result.page(params[:page]).per(5).reverse_order
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
      @order = Order.find(params[:id])
      if @order.update(order_params)
      redirect_to admin_orders_path
      else
      render action: :edit
      end
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