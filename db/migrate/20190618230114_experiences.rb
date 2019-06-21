require 'rest-client'
require 'pry'

class Experiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.string :review
      t.integer :rating
      t.boolean :doAgain
    end
  end
end
