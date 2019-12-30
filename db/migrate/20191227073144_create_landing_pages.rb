class CreateLandingPages < ActiveRecord::Migration[5.1]
  def change
    create_table :landing_pages do |t|
      t.string    :title
      t.string    :video
      t.string    :banner
      t.text      :section_one
      t.string    :color_one
      t.text      :section_two
      t.string    :color_two
      t.text      :section_three
      t.string    :color_three
      t.string    :permalink
      t.timestamps
    end
  end
end
