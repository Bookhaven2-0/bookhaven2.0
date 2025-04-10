class Book < ApplicationRecord

  has_many :library_books 
  has_many :libraries, through: :library_books

  validates :title, presence: true
  validates :author, presence: true 
  validates :description, presence: true
  validates :isbn_10, uniquness: true 
  validates :isbn_13, uniquness: true
end
