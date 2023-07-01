class AddAvgStarToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :avg_star, :float
  end
end
