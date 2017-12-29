class AddCareerToStoryQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column    :story_questions, :career_id, :integer
  end
end
