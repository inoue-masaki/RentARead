class CreateFavarites < ActiveRecord::Migration[6.1]
  def change
    create_table :favarites do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
