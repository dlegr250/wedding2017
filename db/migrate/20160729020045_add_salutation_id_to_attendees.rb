class AddSalutationIdToAttendees < ActiveRecord::Migration
  def change
    remove_column :attendees, :salutation, :string
    add_column :attendees, :salutation_id, :integer
  end
end
