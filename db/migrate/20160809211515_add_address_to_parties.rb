class AddAddressToParties < ActiveRecord::Migration
  def change
    add_column :parties, :address1, :string
    add_column :parties, :address2, :string
    add_column :parties, :city, :string
    add_column :parties, :state, :string
    add_column :parties, :zip, :string
  end
end
