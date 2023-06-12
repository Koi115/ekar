class AddPmhxToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :pmhx, :text
  end
end
