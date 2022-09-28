class ArticlesController < ApplicationController
  before_action :article, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  # GET /articles or /articles.json
  def index
    # @articles = Article.all.page(params[:page])
    # @articles = Article.where("title LIKE ?", "%#{params[:title]}%")

    if params[:title]
      @articles = Article.where("title LIKE ?", "%#{params[:title]}%").page(params[:page])
    else
      @articles = Article.all.page(params[:page])
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])

  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

# binding.pry
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: " 新たな記事を作成しました " }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: " 記事を更新しました " }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: " 記事を削除しました " }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def article
      @article = current_user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
    end
end
