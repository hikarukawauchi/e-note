class ToppagesController < ApplicationController
  def index
    if logged_in?
      @word = current_user.words.build  # form_with 用
      @words = current_user.words.order(id: :desc).page(params[:page])
    end
  end
end
