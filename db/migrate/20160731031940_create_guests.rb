class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :uuid, null: false
      t.belongs_to :account, index: true
      t.belongs_to :party, index: true
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
