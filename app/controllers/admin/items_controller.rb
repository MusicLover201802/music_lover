class Admin::ItemsController < ApplicationController
  def index

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
    redirect_to admin_items_path
    else
    @items = Item.all.reverse_order
    render :new
    end

  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(params[:id])
  end

  def destroy
   item = Item.find(params[:id])
   item.destroy
   redirect_to admin_items_path
  end

  def retire
    item = Item.find(params[:id])
    item.update(retire_flag: true) ### リタイアフラグをtrueに更新
    item.soft_destroy ### 論理削除処理※soft_destroyはkakurenbo-putiの固有メソッド
    redirect_to lovers_retire_path ### 言わずもがな遷移先
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

