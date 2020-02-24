class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.string :seat_type
      t.boolean :is_empty
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
