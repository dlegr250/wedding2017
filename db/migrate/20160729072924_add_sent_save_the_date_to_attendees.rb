class AddSentSaveTheDateToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :sent_save_the_date, :boolean
  end
end
