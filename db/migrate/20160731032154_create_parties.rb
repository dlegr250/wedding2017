class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.belongs_to :account, index: true
      t.string :uuid
      t.string :name

      t.timestamps null: false
    end
  end
end
