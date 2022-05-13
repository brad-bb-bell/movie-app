class ActorAgeToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :actors, :age, "integer USING CAST(age AS integer)"
  end
end
