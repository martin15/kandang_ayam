class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string  :name
      t.text    :address
      t.string  :phone
      t.string  :lat
      t.string  :long
      t.string  :location_url
      t.string  :permalink
      t.timestamps
    end
  end
end
