class CreateComplements < ActiveRecord::Migration[5.1]
  def change
    create_table :complements do |t|
      t.string  :category
      t.string  :name
      t.string  :image
      t.text    :description
      t.timestamps
    end
  end
end
