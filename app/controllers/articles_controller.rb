class ArticlesController < ApplicationController
  
  # calls the set_article method on the following methods edit, update, show, destroy ---refactored code
   # before action should be ordered the way you want them to execute
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
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
    @article.user = current_user
    
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  
  end
  
  
  def update
     #    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
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
    flash[:danger] = "Article was succesfully deleted"
    redirect_to articles_path
  end
  
  def require_same_user
    #check if not current user or not admin
    if current_user != @article.user && !current_user.admin?
      flash[:danger] = "You can only delete your own articles"
      redirect_to root_path
    end
  end 
  

  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)
    end
   
    
end
