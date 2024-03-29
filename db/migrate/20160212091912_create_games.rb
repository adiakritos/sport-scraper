class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  :country
      t.string  :tournament
      t.string  :home_team
      t.string  :away_team
      t.integer :home_score
      t.integer :away_score
      t.integer :timer
      t.integer :time
      t.string  :sport
      t.string  :source
      t.string  :state
      t.timestamps null: false
    end

    add_index :games, :state
    add_index :games, :source
    add_index :games, :tournament
    add_index :games, :sport
  end
end
