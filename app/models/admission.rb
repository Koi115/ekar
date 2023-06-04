class Admission < ApplicationRecord

belongs_to :patient  
belongs_to :ward
belongs_to :roombed


validates :patient, presence: true
validates :ward_id, numericality: { other_than: 1, message: "can't be blank"} 
############ roombed_id 追加実装にて、ward_id が 3,4 1病棟、2病棟ならば、other than 1
############ roombed_id 追加実装にて、ward_id が 2外来ならば、1 -- のみ
validates :roombed_id, numericality: { other_than: 1, message: "can't be blank"} 



end
