class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :summary
      t.text :opinion
      t.integer :rating
    end
  end
end
