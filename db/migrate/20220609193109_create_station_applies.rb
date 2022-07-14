class CreateStationApplies < ActiveRecord::Migration[6.1]
  def change
    create_table :station_applies do |t|
      t.references :exam_apply, null: false, foreign_key: true
      t.string :time_left
      t.boolean :finished

      t.timestamps
    end
  end
end
