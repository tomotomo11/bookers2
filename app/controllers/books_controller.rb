class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    @books = Book.find(params[:id])
    @books = destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
