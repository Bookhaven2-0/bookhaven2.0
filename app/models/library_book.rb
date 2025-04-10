class LibraryBook < ApplicationRecord
  belongs_to :book
  belongs_to :library

  enum condition: { used: 0, new: 1, damaged: 2, destroyed: 3 }
end
