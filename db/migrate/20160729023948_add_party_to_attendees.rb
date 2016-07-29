class AddPartyToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :party, :string
  end
end
