class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :info
      t.string :description
      t.integer :time
      t.string :picture
      t.string :trailer

      t.timestamps
    end
  end
end
