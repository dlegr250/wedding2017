class AddNumberWhoDrinkToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :number_who_drink, :integer
  end
end
