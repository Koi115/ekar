class AddIndexEmployeeIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :employee_id, unique: true
  end
end
