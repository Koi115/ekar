class AddHxofadmToAdmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :admissions, :hxofadm, :text
  end
end
