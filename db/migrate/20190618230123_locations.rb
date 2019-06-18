class Locations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city_name
    end
  end
end
