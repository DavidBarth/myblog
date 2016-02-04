class UsersController < ApplicationController
  # we will have the @user instance variable ready before the actions below will take place
  # the set_user method is defined privately at the bottom
  before_action :set_user, only: [:edit, :update, :show]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  
  #edit form submission will be handled by update action hence defined update action below
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def set_user
     @user = User.find(params[:id])
  end
end