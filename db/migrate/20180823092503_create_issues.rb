class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :summary
      t.integer :status
      t.integer :reporter_id
      t.integer :assignee_id

      t.timestamps
    end
  end
end
