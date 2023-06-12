class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :patient,        null: false, foreign_key: true

      t.string  :full_name1,       null: false, default: ""
      t.string  :full_name_kana1,  null: false, default: ""
      t.string  :relation1,        null: false, default: ""
      t.string  :phone_number11,   null: false, default: ""
      t.string  :phone_number12,   null: false, default: ""
      t.string  :description1,     null: false, default: ""

      t.string  :full_name2,       null: false, default: ""
      t.string  :full_name_kana2,  null: false, default: ""
      t.string  :relation2,        null: false, default: ""
      t.string  :phone_number21,   null: false, default: ""
      t.string  :phone_number22,   null: false, default: ""
      t.string  :description2,     null: false, default: ""

      t.timestamps
    end
  end
end
