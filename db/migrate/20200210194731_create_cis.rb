class CreateCis < ActiveRecord::Migration[6.0]
  def change
    create_table :cis do |t|
      t.integer :amount
      t.integer :cocktail_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
