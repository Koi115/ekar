class Ward < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', max_num_beds: '0' },
    { id: 2, name: '外来', max_num_beds: '0' },
    { id: 3, name: '1病棟', max_num_beds: '50' },
    { id: 4, name: '2病棟', max_num_beds: '40' },
    { id: 9, name: '入院待ち', max_num_beds: '0' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :admissions

end