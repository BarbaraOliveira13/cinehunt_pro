class FavoriteListsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @favorite_lists = current_user.favorite_lists
  end

  def show
    @favorite_list = current_user.favorite_lists.find(params[:id])
  end

  def create
    @favorite_list = current_user.favorite_lists.build(favorite_list_params)

    if @favorite_list.save
      flash[:notice] = 'Liste de favoris créée avec succès.'
    else
      flash[:alert] = "Erreur lors de la création de la liste de favoris."
    end

    redirect_to session.delete(:return_to) || favorite_lists_path
  end

  def new
     session[:return_to] = request.referer
    @favorite_list = FavoriteList.new
  end

  def destroy
    @favorite_list = current_user.favorite_lists.find(params[:id])
    @favorite_list.destroy
    redirect_to favorite_lists_path
  end

  def get_last_favorite_movies
    @last_three_favorite_movies = user.get_last_favorite_movies
    @last_three_favorite_movies ||= []
  end

  private

  def favorite_list_params
    params.require(:favorite_list).permit(:name)
  end
end
