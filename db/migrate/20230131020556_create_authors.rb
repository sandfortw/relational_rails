# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :year_born
      t.boolean :alive

      t.timestamps
    end
  end
end
