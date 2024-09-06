class BooksController < ApplicationController
  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @count = Book.count
    @book = Book.new(position: @count + 1)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully added!"
      redirect_to books_path
    else
      # new action is not call here
      # assign  any instance variables needed
      # @count = Task.count
      render("new")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully edited!"
      redirect_to books_path
    else
      render("edit")
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully deleted!"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :position,
      :author,
      :price,
      :published_date
      )
  end
end
