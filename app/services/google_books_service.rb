class GoogleBooksService
  
  def books_by_isbn(isbn)
    get_url("?q=isbn:#{isbn}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.googleapis.com/books/v1/volumes')
  end
end