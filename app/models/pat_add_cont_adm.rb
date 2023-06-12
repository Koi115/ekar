class PatAddContAdm
  include ActiveModel::Model

  attr_accessor :fa_patient_id, :full_name, :full_name_kana, :gender_id, :blood_abo_id, :blood_rh_id, :date_of_birth, :transfer_id, :description, :pmhx, :image, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :phone_number2
  
  # , :full_name1, :full_name_kana1, :relation1, :phone_number11, :phone_number12, :description1, :full_name2, :full_name_kana2, :relation2, :phone_number21, :phone_number22, :description2, :ward_id, :roombed_id, :admission_date, :hxofadm
  
  validates :gender_id, numericality: {only_integer: true, message: "は無効です"}
  validates :prefecture_id, numericality: {only_integer: true, message: "は無効です"}
  validates :blood_abo_id, numericality: {only_integer: true, message: "は無効です"}
  validates :blood_rh_id, numericality: {only_integer: true, message: "は無効です"}
  validates :transfer_id, numericality: {only_integer: true, message: "は無効です"}
  validates :prefecture_id, numericality: {only_integer: true, message: "は無効です"}
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "(-)をつけて入力してください"}
  # validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  # validates :phone_number11, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  # validates :phone_number12, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  # validates :phone_number21, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  # validates :phone_number22, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}

  with_options presence: true do
    validates :fa_patient_id
    validates :full_name
    validates :full_name_kana
    validates :date_of_birth
  end


  def save
    patient = Patient.create(fa_patient_id: fa_patient_id, full_name: full_name, full_name_kana: full_name_kana, gender_id: gender_id, blood_abo_id: blood_abo_id, blood_rh_id: blood_rh_id, date_of_birth: date_of_birth, transfer_id: transfer_id, description: description, pmhx: pmhx, image: image)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, phone_number2: phone_number2, patient_id: patient.id)

  end





  # Contact.create(full_name1: full_name1, full_name_kana1: full_name_kana1, relation1: relation1, phone_number11: phone_number11, phone_number12: phone_number12, description1: description1, full_name2: full_name2, full_name_kana2: full_name_kana2, relation2: relation2, phone_number21: phone_number21, phone_number22: phone_number22, description2: description2, patient_id: patient.id)
  # Admission.create(ward_id: "2", roombed_id: "1", admission_date: "", hxofadm: "", patient_id: patient.id)








end