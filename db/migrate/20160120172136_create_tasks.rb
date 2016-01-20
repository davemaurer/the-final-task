class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :complete, default: false
      t.text :notes
      t.datetime :due_date
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
