class AddHashtagsToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :hashtags, index: true, foreign_key: true
  end
end
