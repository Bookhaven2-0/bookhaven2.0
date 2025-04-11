class LibraryBook < ApplicationRecord
  belongs_to :book
  belongs_to :library

  enum :condition, { used: 0, band_new: 1, damaged: 2, bad: 3 }
end
