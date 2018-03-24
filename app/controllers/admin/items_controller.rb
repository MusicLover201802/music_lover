class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # @items = Item.search(params[:search])
  end

  def show
    @item = Item.find_by_id(params[:id])
  end

  def edit
  end

  def new
    @item = Item.new
    @track = Track.new
  end

  def create

    @item = Item.new(item_params)
    # binding.pry
     if @item.save
    redirect_to admin_items_path
    redirect_to user_path(current_user)
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
