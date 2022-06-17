class AddStationToStationApplies < ActiveRecord::Migration[6.1]
  def change
    add_reference :station_applies, :station_template, null: false, foreign_key: true
  end
end
