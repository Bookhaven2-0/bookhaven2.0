class Libraries::LibraryBooksController < ApplicationController
  
  def new 
    @library = Library.find(params[:library_id])
    @book = Book.new
  end

  def create
  end

  def destroy 

  end

end