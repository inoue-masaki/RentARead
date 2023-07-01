class AddLenderToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :lender, :string
  end
end
