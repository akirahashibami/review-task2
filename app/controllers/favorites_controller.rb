class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorites.save
    redirect_to book_path(book)
  end

  def destoy
    book = Book.find(params[:book_id])
    faorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to bppk_path(book)
  end
end
