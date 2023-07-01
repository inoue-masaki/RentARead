class AddTitleToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :user_name, :string
  end
end
