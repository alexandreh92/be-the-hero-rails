# frozen_string_literal: true

class AddAttributesToNgos < ActiveRecord::Migration[5.2]
  def change
    add_column :ngos, :login, :string, unique: true
    add_column :ngos, :name, :string
    add_column :ngos, :whatsapp, :string
    add_column :ngos, :city, :string
    add_column :ngos, :uf, :string
  end
end
