class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :name
      t.text :resume
      t.boolean :fixed_station_sequence

      t.timestamps
    end
  end
end
