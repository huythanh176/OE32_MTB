class AddStatusToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :status, :integer, default: :ended
  end
end
