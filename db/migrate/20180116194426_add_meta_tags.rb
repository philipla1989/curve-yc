class AddMetaTags < ActiveRecord::Migration[5.1]
  def change
    add_column    :stories, :meta_name,     :string
    add_column    :stories, :meta_content,  :string
    add_column    :posts,   :meta_name,     :string
    add_column    :posts,   :meta_content,  :string
  end
end
