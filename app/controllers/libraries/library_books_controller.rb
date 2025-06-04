class Libraries::LibraryBooksController < ApplicationController
  
  def new 
    @library = Library.find(params[:library_id])
    @book = Book.new
  end

  def create
    library = Library.find(params[:library_id])
    isbn = book_params[:isbn].strip
    column = isbn.size == 10 ? :isbn_10 : :isbn_13

    book = Book.find_by(column => isbn)
    book ||= Book.new(GoogleBooksFacade.new(book_params[:isbn]).book_details)
    
    if book.save
      LibraryBook.create(library: library, book: book)
      redirect_to library, notice: "#{book.title} has been added."
    else
      redirect_to library, alert: "ISBN was not available, please try again."
    end
  end

  def destroy 
    library = Library.find(params[:library_id])
    book = library.library_books.find_by(book_id: params[:id])
    book.delete
    redirect_to library, notice: "Book has been removed."
  end

  private 
    def book_params 
      params.require(:book).permit(:isbn, :title, :author)
    end

end