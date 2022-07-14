class AddStationTurnToExamApplies < ActiveRecord::Migration[6.1]
  def change
    add_column :exam_applies, :station_turn, :integer
  end
end
