class AddDescriptionToSalutations < ActiveRecord::Migration
  def change
    add_column :salutations, :description, :text
  end
end
