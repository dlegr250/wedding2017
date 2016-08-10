class AddMailingAddressToParties < ActiveRecord::Migration
  def change
    add_column :parties, :mailing_address, :text
  end
end
