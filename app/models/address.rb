class Address < ApplicationRecord
  belongs_to :patient


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
