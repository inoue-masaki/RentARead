class AddFavariteToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :favarite, :boolean, default: false, null: false
  end
end
