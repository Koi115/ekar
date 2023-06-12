# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_07_012658) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "postal_code", default: ""
    t.integer "prefecture_id", default: 40
    t.string "city", default: ""
    t.string "house_number", default: ""
    t.string "building_name", default: ""
    t.string "phone_number", default: ""
    t.string "phone_number2", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_addresses_on_patient_id"
  end

  create_table "admissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.integer "ward_id", default: 2, null: false
    t.integer "roombed_id", default: 1, null: false
    t.date "admission_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "hxofadm"
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "full_name1", default: "", null: false
    t.string "full_name_kana1", default: "", null: false
    t.string "relation1", default: "", null: false
    t.string "phone_number11", default: "", null: false
    t.string "phone_number12", default: "", null: false
    t.string "description1", default: "", null: false
    t.string "full_name2", default: "", null: false
    t.string "full_name_kana2", default: "", null: false
    t.string "relation2", default: "", null: false
    t.string "phone_number21", default: "", null: false
    t.string "phone_number22", default: "", null: false
    t.string "description2", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_contacts_on_patient_id"
  end

  create_table "patients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "fa_patient_id", null: false
    t.string "full_name", default: "", null: false
    t.string "full_name_kana", default: "", null: false
    t.integer "gender_id", default: 1, null: false
    t.integer "blood_abo_id", default: 1, null: false
    t.integer "blood_rh_id", default: 1, null: false
    t.date "date_of_birth", null: false
    t.integer "transfer_id", default: 1, null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "pmhx"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "employee_id", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name", default: "", null: false
    t.integer "department_id", default: 1, null: false
    t.integer "occupation_id", default: 1, null: false
    t.integer "group_id", default: 1, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ward_id", default: 1, null: false
    t.index ["employee_id"], name: "index_users_on_employee_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "patients"
  add_foreign_key "admissions", "patients"
  add_foreign_key "contacts", "patients"
end
