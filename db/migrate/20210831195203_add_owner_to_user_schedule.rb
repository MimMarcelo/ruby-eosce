class AddOwnerToUserSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :user_schedules, :owner, :boolean
  end
end
