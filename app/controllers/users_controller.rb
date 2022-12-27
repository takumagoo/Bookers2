class UsersController < ApplicationController
  def create
    @users = User.new(post_image_params)
    @users.user_id = current_user.id
    @users.save
    flash[:notice] = "You have created book successfully."
    # redirect_to post_images_path
  end

  def new
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @books = Book.new
    @books = Book.all

    @user = User.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to user_path(user.id)
  end

   # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
