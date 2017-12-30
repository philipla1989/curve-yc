class AddEducationToStory < ActiveRecord::Migration[5.1]
  def change
    add_column    :stories, :education, :string
  end
end
