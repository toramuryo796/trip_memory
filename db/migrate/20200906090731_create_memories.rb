class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string     :title,              null:false
      t.string     :destination,        null:false
      t.date       :departure_day,      null:false
      t.date       :return_day,         null:false
      t.integer    :transportation_id,  null:false
      t.text       :trans_memo,         null:false
      t.string     :hotel,              null:false
      t.text       :hotel_memo,         null:false
      t.text       :best,               null:false
      t.text       :happening,          null:false
      t.text       :again,              null:false
      t.references :plan,               null:false, foreign_key: true
      t.references :user,               null:false, foreign_key: true
      t.references :group,              null:false, foreign_key: true
      t.timestamps
    end
  end
end
