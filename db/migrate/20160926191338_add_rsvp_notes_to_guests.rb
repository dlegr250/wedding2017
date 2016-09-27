class AddRsvpNotesToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :rsvp_notes, :text
  end
end
