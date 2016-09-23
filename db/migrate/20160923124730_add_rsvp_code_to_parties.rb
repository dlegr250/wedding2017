class AddRsvpCodeToParties < ActiveRecord::Migration
  def change
    add_column :parties, :rsvp_code, :string
  end
end
