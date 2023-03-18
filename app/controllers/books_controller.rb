class BooksController < ApplicationController
  def index
    render json: Book.all.order("id DESC")
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    if book
      book.update(book_params)
      render json: book, status: :ok
    else
      render json: book.errors, status: :not_found
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book
      book.destroy
      render json:book, status: :ok
    else
      render json: book.errors, status: :not_found
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :author)
  end
end
