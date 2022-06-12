class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    mutalk = Mutalk.find(params[:mutalk_id])
    current_user.favorite(mutalk)
    flash[:success] = "この記事を「いいね」しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    mutalk = Mutalk.find(params[:mutalk_id])
    current_user.unfavorite(mutalk)
    flash[:success] = "この記事の「いいね」を解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
