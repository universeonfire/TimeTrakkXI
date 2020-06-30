class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :comment
      t.string :task_type
      t.date :start_time
      t.string :time_to_start
      t.string :time_to_end

      t.timestamps
    end
  end
end
