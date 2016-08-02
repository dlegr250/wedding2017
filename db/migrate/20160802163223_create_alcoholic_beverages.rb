class CreateAlcoholicBeverages < ActiveRecord::Migration
  def change
    create_table :alcoholic_beverages do |t|
      t.string :uuid
      t.string :name

      t.timestamps null: false
    end
  end
end
