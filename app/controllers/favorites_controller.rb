class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    word = Word.find(params[:word_id])
    user = word.user
    current_user.like(word)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    word = Word.find(params[:word_id])
    user = word.user
    current_user.unlike(word)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end

end
