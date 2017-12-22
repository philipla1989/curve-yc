class CreateStoryQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :story_questions do |t|
      t.integer :story_id
      t.string :question
      t.text :response

      t.timestamps
    end
  end
end
