class UsersController < ApplicationController
  
 
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    if book.save
      flash[:success]="successfully saved"
      redirect_to book_path(book)
    else
      render :index
    end
  end

  def show
    @user = User.find(params[:id])
    @user_books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:success]="successfully updated"
      redirect_to user_path(current_user)
    else
      render :index
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
