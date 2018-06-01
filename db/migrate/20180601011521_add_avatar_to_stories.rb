class AddAvatarToStories < ActiveRecord::Migration[5.1]
  def change
    add_column    :stories, :avatar, :string
  end
end
