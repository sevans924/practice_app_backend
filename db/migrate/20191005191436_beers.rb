class Beers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :abv
      t.boolean :isOrganic
      t.string :category
      t.text :description
    end
  end
end
