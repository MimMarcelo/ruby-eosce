class CreateUserSchedule < ActiveRecord::Migration[6.1]
  def change
    create_table :user_schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
