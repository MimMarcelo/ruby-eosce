class CreateExamApplies < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_applies do |t|
      t.references :exam, null: false, foreign_key: true
      t.string :student_name
      t.string :student_email
      t.string :student_id

      t.timestamps
    end
  end
end
