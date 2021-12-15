class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.datetime :deadline
      t.binary :screenshot
      t.string :bug_type
      t.string :status

      t.integer :project_id
      
      t.timestamps
    end
  end
end
