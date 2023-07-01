class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :publisher, null: false
      t.string :kind, null: false
      t.text :desc
      t.string :image
      t.references :user, null: false, foreign_key: true
      t.boolean :lending, null: false, default: false

      t.timestamps
    end
    add_index :books, [:user_id, :created_at]
  end
end
