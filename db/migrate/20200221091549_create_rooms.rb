class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :number_of_seat
      t.references :theater, foreign_key: true

      t.timestamps
    end
  end
end
