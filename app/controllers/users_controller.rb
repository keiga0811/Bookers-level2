class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def create
  	user = User.new(user_params)
  	user.save
  	redirect_to'/user/:id'
  end

  def index
  	@users = User.all
    @book = Book.new
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction)
  end
end
