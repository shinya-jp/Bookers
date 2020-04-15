class BooksController < ApplicationController
  before_action :set_book, only:[:show, :edit, :update, :destroy]

  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)

  	if @book.save
  		redirect_to book_path(@book.id), notice: 'Book was successfully created'
  	else
  		@books = Book.all
  		render 'index'
  	end
  end

  def show
  end

  def edit
  	flash[:notice] = 'Book was successfully created'
  end

  def update
  	if @book.update(book_params)
  		redirect_to book_path(@book.id)
  	else
  		render 'edit'
  	end

  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end
  def set_book
  	@book = Book.find(params[:id])
  end
  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
