class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.float :initial_rating
      t.string :description
      t.string :isbn_10
      t.string :isbn_13
      t.string :sm_thumbnail_img
      t.string :thumbnail_img

      t.timestamps
    end
  end
end
