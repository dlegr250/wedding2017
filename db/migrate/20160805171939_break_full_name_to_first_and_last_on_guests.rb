class BreakFullNameToFirstAndLastOnGuests < ActiveRecord::Migration
  def change
    add_column :guests, :first_name, :string
    add_column :guests, :last_name, :string
  end
end
