class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  	@user = User.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def create
  	user = User.new(user_params)
  	user.save
  	redirect_to'/user/:id'
  end

  def edit
    @user = User.find(params[:id])
    # @image = 
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(user.id)
    else
    flash[:notice] = "error"
    render :index
    @user = User.find(params[:id])
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
