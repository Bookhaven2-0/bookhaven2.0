class Book < ApplicationRecord

  has_many :library_books 
  has_many :libraries, through: :library_books

  validates :title, presence: true
  validates :author, presence: true 
  validates :description, presence: true

end
