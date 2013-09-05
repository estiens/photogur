class AddVotesToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :votes, :integer, :null => false, :default => 0
  end
end
