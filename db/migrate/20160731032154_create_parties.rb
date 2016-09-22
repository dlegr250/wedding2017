class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.belongs_to :account, index: true
      t.string :uuid
      t.string :name
      t.boolean :save_the_date_sent, default: false
      t.boolean :invitation_sent, default: false
      t.text :mailing_address

      t.timestamps null: false
    end
  end
end
