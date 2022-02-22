class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully posted!"
      redirect_to book_path(@book)
    else 
      @books = Book.all
      render :index
    end 
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "successfully updated!"
    redirect_to book_path(@book)
    else
       render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.delete
    flash[:notice] = "successfully deleted!"
    redirect_to '/books'
    end 
  end
  
  def back
    book.back
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end  

end
