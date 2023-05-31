class Ward < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '外来' },
    { id: 3, name: '1病棟' },
    { id: 4, name: '2病棟' }

  ]

  include ActiveHash::Associations
  has_many :users

end