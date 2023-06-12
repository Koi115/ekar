class Patient < ApplicationRecord

  #--- association ---#
  has_many :addresses
  has_many :contacts
  # join でのテーブル結合のため、admmissions テーブルとはhas_one　だが、has_many にしておく  
  # has_one :admission
  has_many :admissions

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :blood_abo
  belongs_to :blood_rh
  belongs_to :transfer
  has_one_attached :image


  #--- validate ---#
  validates :full_name, presence: true
  validates :full_name_kana, presence: true


  # formオブジェクトエラーのため、一旦コメント
  # validates :fa_patient_id, presence: true
  # validates :fa_patient_id, numericality: true
  # validates_uniqueness_of :fa_patient_id

  # validates :date_of_birth, presence: true
  validates :gender_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :transfer_id, numericality: { other_than: 1, message: "can't be blank"} 

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナ文字を使用してください' } do
    validates :full_name_kana
  end



end
