class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :fiction
      t.integer :author_id
      t.integer :year_written
    end
  end
end
