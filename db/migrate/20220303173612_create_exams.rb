class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
