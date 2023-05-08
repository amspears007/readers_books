class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.integer :year_written
      t.boolean :fiction
      t.references :reader, null: false, foreign_key: true

      t.timestamps
    end
  end
end
