class Ward < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '外来' },
    { id: 3, name: '1病棟' },
    { id: 4, name: '2病棟' },
    { id: 9, name: '入院待ち' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :admissions

end