json.extract! book, :id, :title, :author, :genre, :initial_rating, :description, :isbn_10, :isbn_13, :sm_thumbnail_img, :thumbnail_img, :created_at, :updated_at
json.url book_url(book, format: :json)
