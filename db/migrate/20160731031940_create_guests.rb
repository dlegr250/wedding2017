class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :uuid
      t.string :full_name

      t.timestamps null: false
    end
  end
end
