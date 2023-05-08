class CreateReaders < ActiveRecord::Migration[7.0]
  def change
    create_table :readers do |t|
      t.string :name
      t.integer :age
      t.boolean :avid_reader

      t.timestamps
    end
  end
end
