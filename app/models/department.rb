class Department < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '医局' },
    { id: 3, name: '医事課' },
    { id: 4, name: '外来' },
    { id: 5, name: '１病棟' },
    { id: 6, name: '２病棟' },
    { id: 7, name: '薬剤課' },
    { id: 8, name: '栄養課' },
    { id: 9, name: 'デイケア' },
    { id: 10, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :users


end