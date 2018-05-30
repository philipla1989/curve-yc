class AddTitleToStory < ActiveRecord::Migration[5.1]
  def change
    add_column    :stories, :story_meta_title, :string
  end
end
