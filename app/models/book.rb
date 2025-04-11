class Book < ApplicationRecord

  has_many :library_books 
  has_many :libraries, through: :library_books

  validates :title, presence: true
  validates :author, presence: true 
  validates :description, presence: true
  validates :isbn_10, uniqueness: true 
  validates :isbn_13, uniqueness: true
end
