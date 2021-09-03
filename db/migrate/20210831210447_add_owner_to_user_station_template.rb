class AddOwnerToUserStationTemplate < ActiveRecord::Migration[6.1]
  def change
    add_column :user_station_templates, :owner, :boolean
  end
end
