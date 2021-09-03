class CreateUserStationTemplate < ActiveRecord::Migration[6.1]
  def change
    create_table :user_station_templates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :station_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
