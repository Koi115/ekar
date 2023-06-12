class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.references :patient,        null: false, foreign_key: true
      t.string     :postal_code,     default: ""
      t.integer    :prefecture_id,   default: 40
      t.string     :city,            default: ""
      t.string     :house_number,    default: ""
      t.string     :building_name,   default: ""
      t.string     :phone_number,    default: ""
      t.string     :phone_number2,   default: ""

      t.timestamps
    end
  end
end
