# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
LibraryBook.delete_all
Book.delete_all
Library.delete_all

# Create Libraries
libraries = Library.create!([
  {
    name: "Downtown Community Library",
    address: "100 Main St",
    city: "Denver",
    state: "CO",
    zip_code: "80202",
    charter_number: "DCL-001"
  },
  {
    name: "Northside Branch",
    address: "456 Oak Ave",
    city: "Boulder",
    state: "CO",
    zip_code: "80301",
    charter_number: "NSB-002"
  },
  {
    name: "Sunset Valley Library",
    address: "789 Sunset Blvd",
    city: "Fort Collins",
    state: "CO",
    zip_code: "80521",
    charter_number: "SVL-003"
  }
])

# Create Books
books = Book.create!([
  {
    title: "The Pragmatic Programmer",
    author: "Andrew Hunt & David Thomas",
    genre: "Programming",
    initial_rating: 4.8,
    description: "A practical guide for software developers.",
    isbn_10: "020161622X",
    isbn_13: "9780201616224",
    sm_thumbnail_img: nil,
    thumbnail_img: nil
  },
  {
    title: "Where the Crawdads Sing",
    author: "Delia Owens",
    genre: "Fiction",
    initial_rating: 4.5,
    description: "A mysterious coming-of-age story set in the marshes of North Carolina.",
    isbn_10: "0735219095",
    isbn_13: "9780735219090",
    sm_thumbnail_img: "http://books.google.com/books/content?id=Xs3-jwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
    thumbnail_img: nil
  },
  {
    title: "Educated",
    author: "Tara Westover",
    genre: "Memoir",
    initial_rating: 4.7,
    description: "A memoir about a woman who escapes her survivalist family to get an education.",
    isbn_10: "0399590501",
    isbn_13: "9780399590504",
    sm_thumbnail_img: "http://books.google.com/books/content?id=Xs3-jwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
    thumbnail_img: nil
  },
  {
    title: "Atomic Habits",
    author: "James Clear",
    genre: "Self-Help",
    initial_rating: 4.9,
    description: "Tiny changes, remarkable results.",
    isbn_10: "0735211299",
    isbn_13: "9780735211292",
    sm_thumbnail_img: "http://books.google.com/books/content?id=Xs3-jwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
    thumbnail_img: nil
  }
])

# Associate books with libraries
LibraryBook.create!([
  { library: libraries[0], book: books[0], condition: 1 },
  { library: libraries[0], book: books[1], condition: 0 },
  { library: libraries[1], book: books[2], condition: 2 },
  { library: libraries[2], book: books[0], condition: 1 },
  { library: libraries[2], book: books[3], condition: 0 }
])
