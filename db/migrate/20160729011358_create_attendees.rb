class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :uuid, null: false
      t.string :full_name
      t.string :salutation
      t.string :phone_number
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :number_invited
      t.integer :number_attending
      t.text :notes
      t.text :wedding_gift

      t.timestamps null: false
    end
  end
end
