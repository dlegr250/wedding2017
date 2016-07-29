class CreateSalutations < ActiveRecord::Migration
  def change
    create_table :salutations do |t|
      t.string :value
      t.string :uuid

      t.timestamps null: false
    end
  end
end
