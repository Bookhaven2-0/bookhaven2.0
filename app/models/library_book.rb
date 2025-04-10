class LibraryBook < ApplicationRecord
  belongs_to :book
  belongs_to :library

  enum condition: { new: 0, used: 1, damaged: 2, destroyed: 3 }
end
