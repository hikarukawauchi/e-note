class WordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @word = current_user.words.build(word_params)
    if @word.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @words = current_user.words.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @word.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def word_params
    params.require(:word).permit(:content, :description)
  end
  
  def correct_user
    @word = current_user.words.find_by(id: params[:id])
    unless @word
      redirect_to root_url
    end
  end
end
