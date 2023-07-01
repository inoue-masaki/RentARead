class ChangeDataLendingToBook < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :lending, :string
  end
end
