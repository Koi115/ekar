class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '医師' },
    { id: 3, name: '指定医' },
    { id: 4, name: '看護師' },
    { id: 5, name: '薬剤師' },
    { id: 6, name: '作業療法士' },
    { id: 7, name: '理学療法士' },
    { id: 8, name: '言語聴覚士' },
    { id: 9, name: '栄養士' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users

  end