class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|

      t.integer :fa_patient_id,      null: false, unique: true
      t.string  :full_name,          null: false, default: ""
      t.string  :full_name_kana,     null: false, default: ""
      t.integer :gender_id,          null: false, default: 1
      t.integer :blood_abo_id,       null: false, default: 1
      t.integer :blood_rh_id,        null: false, default: 1
      t.date    :date_of_birth,      null: false
      t.integer :transfer_id,        null: false, default: 1
      t.text    :description,        null: false

      t.timestamps
    end
  end
end
