class Experiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :reivew
      t.string :rating
      t.boolean :rvsp?
    end
  end
end
