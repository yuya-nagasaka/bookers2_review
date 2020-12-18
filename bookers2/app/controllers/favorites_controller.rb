class FavoritesController < ApplicationController
  
  def create
    unless current_user.favorites.include?(clicked_book)
       favorite = current_user.favorites.new(book_id: clicked_book.id)
       if favorite.save
         redirect_back(fallback_location: root_path)
       end
    else
       redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    unless current_user.favorites.include?(clicked_book)
      favorite = current_user.favorites.find_by(book_id: clicked_book.id)
      if favorite.destroy
        redirect_back(fallback_location: root_path)
      end
    else
       redirect_back(fallback_location: root_path)
    end
  end
  
  private

  def clicked_book
    Book.find(params[:book_id])
  end
  
end
