class ArticlesController < ApplicationController
  
  # calls the set_article method on the following methods edit, update, show, destroy ---refactored code
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end
  
  def new
    #instance variable 
    @article = Article.new
  end
  
  def edit
       # @article = Article.find(params[:id])  
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  
  end
  
  
  def update
     #    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  
  def show
     #    @article = Article.find(params[:id])
  end
  
  
  def destroy
     #     @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was succesfully deleted"
    redirect_to articles_path
  end
  

  private
    
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)
    end
   
    
end
