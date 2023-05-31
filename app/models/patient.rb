class Patient < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :blood_abo
  belongs_to :blood_rh
  belongs_to :transfer



  validates :full_name, presence: true
  validates_uniqueness_of :fa_patient_id
  validates :gender_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :blood_abo_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :blood_rh_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :transfer_id, numericality: { other_than: 1, message: "can't be blank"} 



end
