class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :user_id, nil: false 
      t.string :title
      t.text :question
      t.text :problem_description

      t.timestamps
    end
  end
end
