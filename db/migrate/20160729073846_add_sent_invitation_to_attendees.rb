class AddSentInvitationToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :sent_invitation, :boolean
  end
end
