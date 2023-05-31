class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :department
  belongs_to :ward
  belongs_to :group
  belongs_to :occupation
  


  validates :full_name, presence: true
  validates_uniqueness_of :employee_id
  validates :employee_id, presence: true

  validates :department_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :ward_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :occupation_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :group_id, numericality: { other_than: 1, message: "can't be blank"} 



  # devise機能のemail_requireを停止 2023.05.26
         def email_required?
          false
        end



end
