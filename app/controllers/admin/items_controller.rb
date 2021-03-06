class Admin::ItemsController < ApplicationController

    before_action :authenticate_admin!

  def index
    # @items = Item.all.reverse_order
    #@items = Item.page(params[:page]).per(5).reverse_order
            ### 検索用 ###
    @search = Item.ransack(params[:q])
    @selects = @search.result.page(params[:page]).per(5).reverse_order

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    discs = @item.discs.build
    tracks = discs.tracks.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_items_path, notice: "商品登録が完了しました"
    else
    @items = Item.all.reverse_order
    render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path(item_params), notice: "商品編集が完了しました。"
    else
    render :edit
    end
  end

  def destroy
   item = Item.find(params[:id])
   item.destroy
   redirect_to admin_items_path, notice: "商品削除が完了しました。"
  end


  private

  def item_params
      params.require(:item).permit(
        :id,
        :item_name,
        :artist_name,
        :artist_name_kana,
        :genre_id,
        :price,
        :label_name,
        :stock,
        :release_date,
        :purchase_flag,
        :admin_id,
        :jacket_image, {
        discs_attributes: [:id, :disc_num, :item_id, :disc_name, :_destroy, {
          tracks_attributes: [:id, :track_num, :track_name, :disc_id, :_destroy] } ] })
  end

end

# {
#   "item_name"=>"a",
#    "artist_name"=>"b", 
#    "artist_name_kana"=>"ア", 
#    "genre_id"=>"1", 
#    "price"=>"1000", 
#    "label_name"=>"t", 
#    "stock"=>"10", 
#    "release_date"=>"20180101", 
#    "admin_id"=>"1", 
#    "purchase_flag"=>"0", 
#    "discs_attributes"=>{
#       "0"=>{
#         "disc_name"=>"aa", 
#         "disc_num"=>"1", 
#         "tracks_attributes"=>{
#             "0"=>{
#               "track_num"=>"", 
#               "track_name"=>""}
#               }
#               }
#               }
#               } permitted: false>


