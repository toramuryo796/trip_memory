class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string     :hour_id
      t.string     :minute_id
      t.text       :program,        null: false
      t.integer    :category_id
      t.bigint     :plan_id,        null: false, foreign_key: true
      t.bigint     :user_id,        null: false, foreign_key: true  
      t.bigint     :day_how_id,     foreign_key: true  
      t.timestamps
    end
  end
end
