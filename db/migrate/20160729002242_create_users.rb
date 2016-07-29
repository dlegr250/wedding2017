class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin, default: false
      t.string :email
      t.string :uuid, null: false
      t.string :password_digest
      t.string :authentication_token
      t.string :password_reset_token
      t.datetime :password_reset_token_sent_at
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.string :full_name

      t.timestamps null: false
    end
  end
end
