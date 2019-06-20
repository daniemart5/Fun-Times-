require 'rest-client'

class Events < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.integer :price
      t.string :kind
    end
  end
end
