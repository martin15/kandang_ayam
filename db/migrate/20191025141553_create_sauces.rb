class CreateSauces < ActiveRecord::Migration[5.1]
  def change
    create_table :sauces do |t|
      t.string  :category
      t.string  :name
      t.string  :image
      t.text    :description
      t.timestamps
    end
  end
end
