class Roombed < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '101-1' },
    { id: 3, name: '101-2' },
    { id: 4, name: '101-3' },
    { id: 5, name: '101-4' },
    { id: 6, name: '102-1' },
    { id: 7, name: '102-2' },
    { id: 8, name: '102-3' },
    { id: 9, name: '102-4' },
    { id: 10, name: '103-1' },
    { id: 11, name: '103-2' },
    { id: 12, name: '103-3' },
    { id: 13, name: '103-4' },
    { id: 14, name: '105-1' },
    { id: 15, name: '105-2' },
    { id: 16, name: '105-3' },
    { id: 17, name: '105-4' },
    { id: 18, name: '106' },
    { id: 19, name: '107' },
    { id: 20, name: '199' },
    { id: 21, name: '201-1' },
    { id: 22, name: '201-2' },
    { id: 23, name: '201-3' },
    { id: 24, name: '201-4' },
    { id: 25, name: '202-1' },
    { id: 26, name: '202-2' },
    { id: 27, name: '202-3' },
    { id: 28, name: '202-4' },
    { id: 29, name: '203-1' },
    { id: 30, name: '203-2' },
    { id: 31, name: '203-3' },
    { id: 32, name: '203-4' },
    { id: 33, name: '205-1' },
    { id: 34, name: '205-2' },
    { id: 35, name: '205-3' },
    { id: 36, name: '205-4' },
    { id: 37, name: '206' },
    { id: 38, name: '207' },
    { id: 39, name: '299' }

  ]

  include ActiveHash::Associations
  has_many :admissions

end