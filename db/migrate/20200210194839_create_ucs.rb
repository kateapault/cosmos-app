class CreateUcs < ActiveRecord::Migration[6.0]
  def change
    create_table :ucs do |t|
      t.integer :user_id
      t.integer :cocktail_id
      t.integer :rating

      t.timestamps
    end
  end
end
