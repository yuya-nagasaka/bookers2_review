class SearchsController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    search_way = params[:search_way]
    if @range == '1'
      @users = User.search(search,search_way)
    else
      @books = Book.search(search,search_way)
    end
  end
end