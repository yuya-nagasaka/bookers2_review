class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def self.search(search,search_way)
    if search_way == "1"
      @books = Book.where("title LIKE?","#{search}%")
    elsif search_way == "2"
      @books = Book.where("title LIKE?","%#{search}")
    elsif search_way == "3"
      @books = Book.where(title: search)
    elsif search_way == "4"
      @books = Book.where("title LIKE?","%#{search}%")
    else
      @books = Book.all
    end
  end
  
end
