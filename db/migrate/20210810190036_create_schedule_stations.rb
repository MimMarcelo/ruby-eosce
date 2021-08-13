class CreateScheduleStations < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_stations do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :station_template, null: false, foreign_key: true
      t.integer :score
      t.integer :level

      t.timestamps
    end
  end
end
