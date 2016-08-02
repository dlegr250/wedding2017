class AddPartyIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :party_id, :integer, index: true
  end
end
