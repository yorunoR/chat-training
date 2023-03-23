class CreateAnswerHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.text :question, null: false
      t.text :answer, null: false

      t.timestamps
    end
  end
end
