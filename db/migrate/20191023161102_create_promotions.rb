class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.string    :name
      t.text      :description
      t.text      :term_and_conditions
      t.string    :image
      t.string    :promo_type
      t.string    :permalink
      t.timestamps
    end
  end
end
