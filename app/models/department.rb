class Department < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '医局' },
    { id: 3, name: '医事課' },
    { id: 4, name: '看護部' },
    { id: 5, name: '薬剤課' },
    { id: 6, name: '栄養課' },
    { id: 7, name: '臨床検査課' },
    { id: 8, name: 'リハビリ課' },
    { id: 9, name: '放射線課' },
    { id: 10, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :users


end