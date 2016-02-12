class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :sport
      t.string :source
      t.string :home_team
      t.string :away_team
      t.string :league
      t.string :state
      t.integer :game_id
      t.integer :date
      t.integer :home_score
      t.integer :away_score
      t.timestamps null: false
    end

    add_index :games, :state
    add_index :games, :date
    add_index :games, :league
    add_index :games, :sport
  end
end
