class SearchsController < ApplicationController
  
  def search
    @search =params[:search]
    @books = Book.all
    @books = @books.where('title LIKE (?) or body LIKE (?)',"%#{params[:search]}%","%#{params[:search]}%")
  end
end
