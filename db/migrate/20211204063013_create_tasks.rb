class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.datetime :deadline, null: false
      t.integer :duration_hours, null: false
      t.integer :duration_minutes, null: false
      t.string :duration
      t.text :description
      t.boolean :split_up, default: false, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
