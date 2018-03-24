class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # @items = Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def new
    @item = Item.new
    @track = Track.new
  end

  def create

    @item = Item.new(item_params)
     if @item.save
    redirect_to admin_items_path
    else
    @items = Item.all.reverse_order
    render :new
    end

  end

  def update
  end

  def destroy
  end

end
