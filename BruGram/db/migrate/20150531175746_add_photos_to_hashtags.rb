class AddPhotosToHashtags < ActiveRecord::Migration
  def change
    add_reference :hashtags, :photos, index: true, foreign_key: true
  end
end
