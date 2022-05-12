class RemoveActorsFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :actors, :string
  end
end
