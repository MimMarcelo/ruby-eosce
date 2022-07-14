class AddFeedbackToStationTemplates < ActiveRecord::Migration[6.1]
  def change
    add_column :station_templates, :feedback, :integer
  end
end
