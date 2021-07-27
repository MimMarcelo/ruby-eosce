class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true
      t.text :open_answer

      t.timestamps
    end
  end
end
