class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.integer :user_id,nil: false
      t.integer :question_id,nil: false
      t.text :description
      t.integer :parent_answer_id

      t.timestamps
    end
  end
end
