class AddDeliveryFormatToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :delivery_format, :string
  end
end
