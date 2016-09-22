class CreateDrinkings < ActiveRecord::Migration
  def change
    create_table :drinkings do |t|
      t.string :uuid
      t.belongs_to :guest, index: true
      t.belongs_to :alcoholic_beverage, index: true

      t.timestamps null: false
    end
  end
end
