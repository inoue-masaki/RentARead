class AddStarCountsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :star_count, :integer
  end
end
