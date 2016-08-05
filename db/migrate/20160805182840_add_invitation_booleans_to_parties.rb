class AddInvitationBooleansToParties < ActiveRecord::Migration
  def change
    add_column :parties, :save_the_date_sent, :boolean, default: false
    add_column :parties, :invitation_sent, :boolean, default: false
  end
end
