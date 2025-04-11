class Library < ApplicationRecord
  has_many :library_books, dependent: :destroy
  has_many :books, through: :library_books

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :charter_number, presence: true 
  
  def city_state
    "#{city}, #{state}"
  end

  def full_address 
    "#{address}, #{city}, #{state} #{zip_code}"
  end
end
