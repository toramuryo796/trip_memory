class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer    :hour_id,        null: false
      t.integer    :minute_id,      null: false
      t.string     :program,        null: false
      t.integer    :category_id,    null: false
      t.integer    :day,            null: false
      t.bigint     :plan_id,        null: false, foreign_key: true
      t.bigint     :user_id,        null: false, foreign_key: true  
      t.bigint     :how_day_id,     foreign_key: true  
      t.timestamps
    end
  end
end
