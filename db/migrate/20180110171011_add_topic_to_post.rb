class AddTopicToPost < ActiveRecord::Migration[5.1]
  def change
    add_column    :posts, :topic,   :string
    add_column    :posts, :author,  :string
  end
end
