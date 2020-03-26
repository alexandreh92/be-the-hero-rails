# frozen_string_literal: true

class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :title
      t.string :description
      t.decimal :value, precision: 8, scale: 2
      t.references :ngo, foreign_key: true

      t.timestamps
    end
  end
end
