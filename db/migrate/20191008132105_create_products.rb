class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string    :name
      t.text      :description
      t.integer   :price
      t.boolean   :best_seller
      t.boolean   :favorite
      t.integer   :category_id
      t.string    :permalink
      t.timestamps
    end
  end
end
