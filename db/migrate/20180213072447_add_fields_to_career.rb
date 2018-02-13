class AddFieldsToCareer < ActiveRecord::Migration[5.1]
  def change
    add_column    :careers, :ini_career_path,     :string
    add_column    :careers, :sub_career_path,     :string
  end
end
