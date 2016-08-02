class AddAccountToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :account_id, :integer, index: true
  end
end
