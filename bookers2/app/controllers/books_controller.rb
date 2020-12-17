class BooksController < ApplicationController
  
 before_action:correct,only:[:edit]
 
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
   @books = Book.all
   @book = Book.new(book_params)
    if @book.save
      flash[:success]="successfully saved"
      redirect_to book_path(@book)
    else
      flash[:false]="saving error"
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:success]="successfully updated"
     redirect_to book_path(@book)
    else
      flash[:false]="updating error"
      render :index
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def correct
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end
end
