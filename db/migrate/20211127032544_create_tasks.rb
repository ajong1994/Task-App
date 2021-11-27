class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :category_id
      t.string :name
      t.string :body
      t.date :task_date
      t.timestamps
    end
  end
end
