class CreateProductsComplements < ActiveRecord::Migration[5.1]
  def change
    create_table :products_sauces do |t|
      t.integer   :product_id
      t.integer   :complement_id
      t.timestamps
    end
  end
end
