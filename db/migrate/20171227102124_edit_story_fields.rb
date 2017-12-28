class EditStoryFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :stories, :sub_title
    remove_column :stories, :sub_career_path
    remove_column :stories, :sub_industry
    remove_column :stories, :sub_company
    remove_column :stories, :sub_company_type
    add_column    :stories, :vanity_url, :string
    add_column    :stories, :quote, :text
  end
end
