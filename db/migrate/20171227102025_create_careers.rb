class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string :name
      t.string :title
      t.string :industry
      t.string :company
      t.string :company_type
      t.integer :story_id
      t.string :precedent_career

      t.timestamps
    end
  end
end
