class CreateAuthor < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :year_born
      t.boolean :dead_or_alive
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
