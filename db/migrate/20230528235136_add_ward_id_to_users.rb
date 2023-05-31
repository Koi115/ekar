class AddWardIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ward_id, :integer, null: false, default: 1
  end
end
