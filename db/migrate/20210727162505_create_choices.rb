class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.references :question, null: false, foreign_key: true
      t.text :body
      t.boolean :correct

      t.timestamps
    end
  end
end
