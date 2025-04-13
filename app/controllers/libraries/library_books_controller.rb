class Libraries::LibraryBooksController < ApplicationController
  
  def new 
    @library = Library.find(params[:library_id])
    @book = Book.new
  end

  def create
    library = Library.find(params[:library_id])
    isbn = :isbn_10 if book_params[:isbn].strip.size == 10
    isbn = :isbn_13 if book_params[:isbn].strip.size == 13

    book = Book.find_by(isbn => book_params[:isbn])

    if book 
      LibraryBook.create(library: library, book: book)
      redirect_to library, notice: "#{book.title} has been added."
    elsif new_book = Book.new(GoogleBooksFacade.new(book_params[:isbn]).book_details)
      LibraryBook.create(library: library, book: new_book)
      redirect_to library, notice: "#{new_book.title} has been added."
    else
      redirect_to library, alert: "ISBN was not available, please try again."
    end
  end

  def destroy 
    library = Library.find(params[:library_id])
    book = library.books.find(params[:id])
    library.books.delete(book)
    redirect_to library, notice: "Book has been removed."
  end

  private 
    def book_params 
      params.require(:book).permit(:isbn, :title, :author)
    end

end