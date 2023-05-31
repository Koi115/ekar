class Transfer < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '独歩' },
    { id: 3, name: '護送' },
    { id: 4, name: '担送' }
  ]


  include ActiveHash::Associations
  has_many :patients


end