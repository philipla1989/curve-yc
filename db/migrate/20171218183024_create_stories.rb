class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :location
      t.string :linkedin_url
      t.integer :ini_age
      t.integer :sub_age
      t.string :ini_title
      t.string :sub_title
      t.string :ini_career_path
      t.string :sub_career_path
      t.string :ini_industry
      t.string :sub_industry
      t.string :ini_company
      t.string :sub_company
      t.string :ini_company_type
      t.string :sub_company_type
      t.text :sumary

      t.timestamps
    end
  end
end
