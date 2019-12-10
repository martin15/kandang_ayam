class CreateLocationImages < ActiveRecord::Migration[5.1]
  def change
    create_table :location_images do |t|
      t.string    :image
      t.integer   :location_id
      t.timestamps
    end
  end
end
