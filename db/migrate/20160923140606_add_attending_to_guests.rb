class AddAttendingToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :attending, :boolean, default: true
  end
end
