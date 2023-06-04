class CreateAdmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :admissions do |t|
      t.references :patient,         null: false, foreign_key: true
      t.integer    :ward_id,         null: false, default: 2
      t.integer    :roombed_id,      null: false, default: 1
      t.date       :admission_date

      t.timestamps
    end
  end
end
