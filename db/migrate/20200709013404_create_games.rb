class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :developer
      t.integer :year
      t.integer :user_id
      t.integer :review_id
    end
  end
end
