class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.search(params[:search])
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
    @item = Item.new
    @track = Track.new
    @item.save
    @track.save
    redirect_to admin_items_path(@item)
  end

  def update
  end

  def destroy
  end

end