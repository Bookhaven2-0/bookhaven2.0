class Library < ApplicationRecord


  def city_state
    "#{city}, #{state}"
  end
end
