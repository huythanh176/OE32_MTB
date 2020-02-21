class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :movie, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
