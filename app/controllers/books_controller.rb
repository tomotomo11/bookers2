class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)
    else
      redirect_to books_path
    end
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
    redirect_to books_path
    end
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if  book.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(book.id)
    else
      redirect_to edit_book_path(book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :title, :body)
  end

end
