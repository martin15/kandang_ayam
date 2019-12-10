class CreatePromotionCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :promotion_codes do |t|
      t.string    :name
      t.string    :code
      t.integer   :user_id
      t.boolean   :state
      t.date      :start_date
      t.date      :end_date
      t.timestamps
    end
  end
end
