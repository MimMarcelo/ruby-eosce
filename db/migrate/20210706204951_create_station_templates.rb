class CreateStationTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :station_templates do |t|
      t.string :name
      t.text :resume
      t.text :procedure
      t.text :evaluation
      t.integer :score
      t.integer :minutes
      t.integer :level

      t.timestamps
    end
  end
end
