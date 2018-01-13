class AddVanityUrlToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column    :posts, :vanity_url,   :string
  end
end
