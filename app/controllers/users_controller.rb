class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]
  def create
    @users = User.new(post_image_params)
    @users.user_id = current_user.id
    if @users.save
        flash[:notice] = "You have created user successfully."
    else
      render :edit
    end
  end

  def new
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

   # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
