class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
    genres = Item.find_by_genre_id(params[:id])
    @genre = Genre.find_by_id(genres)
    # binding.pry
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    discs = @item.discs.build
    tracks = discs.tracks.build
    # 2.times { tracks }
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def update
    item = Item.find(params[:id])

    binding.pry


    item.update(item_params)
    redirect_to admin_items_path
  end

  def destroy
   item = Item.find(params[:id])
   item.destroy
   redirect_to admin_items_path
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



