class AddIndexFavaritesuserId < ActiveRecord::Migration[6.1]
  def change
    add_index :favarites, :user_id
    add_index :favarites, :book_id
    add_index :favarites, [:user_id, :book_id], unique: true
  end
end
