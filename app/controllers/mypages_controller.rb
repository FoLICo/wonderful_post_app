class MypagesController < ApplicationController

  def index
    # binding.pry
    @articles = current_user.articles.all.page(params[:page])

    if params[:title]
      @articles = current_user.articles.preload(:tags).where("title LIKE ?", "%#{params[:title]}%").page(params[:page])
    else
      @articles = current_user.articles.preload(:tags).all.page(params[:page])
    end

  end

end
