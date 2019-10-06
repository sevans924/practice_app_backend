class Ratings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :beer, foreign_key: true
      t.integer :rating_num
      t.text :review
    end
  end
end
