class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.datetime :deadline, null: false
      t.integer :duration_hours, default: 1, null: false
      t.integer :duration_minutes, default: 0, null: false
      t.text :description
      t.boolean :split_up, default: false, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
