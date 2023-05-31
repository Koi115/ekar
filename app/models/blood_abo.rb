class BloodAbo < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'A' },
    { id: 3, name: 'B' },
    { id: 4, name: 'O' },
    { id: 5, name: 'AB' }
  ]


  include ActiveHash::Associations
  has_many :patients


end