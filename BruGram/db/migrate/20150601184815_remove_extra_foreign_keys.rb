class RemoveExtraForeignKeys < ActiveRecord::Migration
  def change
  	remove_column :photos, :hashtags_id
  	remove_column :hashtags, :photos_id
  end
end
