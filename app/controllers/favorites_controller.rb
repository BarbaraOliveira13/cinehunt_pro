class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_back(fallback_location: favorite_lists_path)
    else
      puts @favorite.errors.full_messages
    end
  end


  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    # @favorite_list = FavoriteList.find(params[:id])

    # @favorite_list.favorites.destroy_all

    # @favorite_list.destroy
    redirect_back(fallback_location: favorite_lists_path)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:scene_id, :favorite_list_id)
  end
end
