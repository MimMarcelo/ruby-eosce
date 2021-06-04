class CreateOsces < ActiveRecord::Migration[6.1]
  def change
    create_table :osces do |t|
      t.string :title
      t.string :resume
      t.boolean :accept_comments
      t.boolean :fixed_station_order

      t.timestamps
    end
  end
end
