class CreateDrinkings < ActiveRecord::Migration
  def change
    create_table :drinkings do |t|
      t.string :uuid
      t.integer :guest_id
      t.integer :alcoholic_beverage_id

      t.timestamps null: false
    end
  end
end
