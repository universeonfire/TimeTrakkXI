class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :comment
      t.date :date
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
