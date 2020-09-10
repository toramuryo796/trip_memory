class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string     :title,            null:false
      t.string     :destination,      null:false
      t.date       :departure_day,    null:false
      t.date       :return_day,       null:false
      t.integer    :transportation_id
      t.text       :trans_memo
      t.string     :hotel
      t.text       :hotel_memo
      t.text       :best
      t.text       :happening
      t.text       :again
      t.references :plan,              null:false, foreign_key: true
      t.references :user,              null:false, foreign_key: true
      t.references :group,             null:false, foreign_key: true
      t.timestamps
    end
  end
end
