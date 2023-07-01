class AddBorrowerToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :borrower, :string
  end
end
