class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.integer :user_id
      t.integer :cocktail_id

      t.timestamps
    end
  end
end
