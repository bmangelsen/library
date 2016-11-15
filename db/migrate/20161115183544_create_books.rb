class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn_no
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
