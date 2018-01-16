class RenameVanituUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :stories, :vanity_url, :slug
    rename_column :posts,   :vanity_url, :slug

    add_index     :stories, :slug, unique: true
    add_index     :posts,   :slug, unique: true
  end
end
