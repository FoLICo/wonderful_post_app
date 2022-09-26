class MypagesController < ApplicationController

  def index
    # binding.pry
    @articles = current_user.articles.all
  end

end
