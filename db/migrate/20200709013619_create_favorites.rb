class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :game_id
    end
  end
end
