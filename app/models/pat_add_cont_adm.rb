class PatAddContAdm
  include ActiveModel::Model

  attr_accessor :fa_patient_id, :full_name, :full_name_kana, :gender_id, :blood_abo_id, :blood_rh_id, :date_of_birth, :transfer_id, :description, :pmhx, :image, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :phone_number2, :full_name1, :full_name_kana1, :relation1, :phone_number11, :phone_number12, :description1, :full_name2, :full_name_kana2, :relation2, :phone_number21, :phone_number22, :description2, :ward_id, :roombed_id, :admission_date, :hxofadm
  


#-----  validation for patients-table  -----#
  with_options presence: true do
    validates :fa_patient_id
    validates :gender_id, numericality: {other_than: 1, message: "を入力してください"}
    validates :date_of_birth
    validates :transfer_id, numericality: {other_than: 1, message: "を入力してください"}
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :full_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナ文字を使用してください' } do
    validates :full_name_kana
  end

  # 上にまとめて記載 x2
  # validates :gender_id, numericality: {other_than: 1, message: "を入力してください"}
  # validates :transfer_id, numericality: {other_than: 1, message: "を入力してください"}

  # 不要のvalidate x3
  # validates :prefecture_id, numericality: {only_integer: true, message: "は無効です"}
  # validates :blood_abo_id, numericality: {only_integer: true, message: "は無効です"}
  # validates :blood_rh_id, numericality: {only_integer: true, message: "は無効です"}



  #-----  validation for addresses-table  -----#
  with_options if: :postal_code_presence? do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "(-)をつけて入力してください"}
  end

  with_options if: :phone_number_presence? do
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  end

  with_options if: :phone_number2_presence? do
    validates :phone_number2, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  end



  #-----  validation for contacts-table  -----#
  with_options if: :full_name1_presence? do
    validates :full_name1, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  end

  with_options if: :full_name_kana1_presence? do
    validates :full_name_kana1, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナ文字を使用してください' }
  end

  with_options if: :phone_number11_presence? do
    validates :phone_number11, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  end

  with_options if: :phone_number12_presence? do
    validates :phone_number12, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  end

  with_options if: :full_name2_presence? do
    validates :full_name2, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  end

  with_options if: :full_name_kana2_presence? do
    validates :full_name_kana2, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナ文字を使用してください' }
  end

  with_options if: :phone_number21_presence? do
    validates :phone_number21, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  end

  with_options if: :phone_number22_presence? do
    validates :phone_number22, format: {with: /\A\d{10,11}\z/, message: "は不正な番号です"}
  end
  

#-------  tables へのレコード追加  -------#
  def save
    patient = Patient.create(fa_patient_id: fa_patient_id, full_name: full_name, full_name_kana: full_name_kana, gender_id: gender_id, blood_abo_id: blood_abo_id, blood_rh_id: blood_rh_id, date_of_birth: date_of_birth, transfer_id: transfer_id, description: description, pmhx: pmhx, image: image)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, phone_number2: phone_number2, patient_id: patient.id)
    Contact.create(full_name1: full_name1, full_name_kana1: full_name_kana1, relation1: relation1, phone_number11: phone_number11, phone_number12: phone_number12, description1: description1, full_name2: full_name2, full_name_kana2: full_name_kana2, relation2: relation2, phone_number21: phone_number21, phone_number22: phone_number22, description2: description2, patient_id: patient.id)
    Admission.create(ward_id: "2", roombed_id: "1", admission_date: "", hxofadm: "", patient_id: patient.id)
  end



#-------  formへの入力有無をチェック  -------#
#--  address-table  --#
  def postal_code_presence?
    postal_code != ""
  end

  def phone_number_presence?
    phone_number != ""
  end

  def phone_number2_presence?
    phone_number2 != ""
  end

#--  contacts-table  --#
  def full_name1_presence?
    full_name1 != ""
  end

  def full_name_kana1_presence?
    full_name_kana1 != ""
  end

  def phone_number11_presence?
    phone_number11 != ""
  end

  def phone_number12_presence?
    phone_number12 != ""
  end

  def full_name2_presence?
    full_name2 != ""
  end

  def full_name_kana2_presence?
    full_name_kana2 != ""
  end

  def phone_number21_presence?
    phone_number21 != ""
  end

  def phone_number22_presence?
    phone_number22 != ""
  end

end