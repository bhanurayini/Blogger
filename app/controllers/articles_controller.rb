class ArticlesController < ApplicationController

  # path is articles
  def index
    @articles = Article.all
  end
  # path is articles/id
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  # path is articles/new
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article #{@article.title} created"
    redirect_to(article_path(@article))
  end
  def edit
    @article = Article.find(params[:id])
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article #{@article.title} destroyed"
    redirect_to(articles_path)
  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article #{@article.title} updated"
    redirect_to(article_path(@article))
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
