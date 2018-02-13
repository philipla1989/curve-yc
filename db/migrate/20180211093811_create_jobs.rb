class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :industry
      t.string :company_type
      t.string :age
      t.integer :career_id

      t.timestamps
    end
  end
end
