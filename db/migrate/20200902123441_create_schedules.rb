class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime   :move_time,      null: false
      t.string     :program,        null: false
      t.integer    :category_id,    null: false
      t.references :plan,           null: false, foreign_key: true
      t.references :user,           null: false, foreign_key: true  
      t.timestamps
    end
  end
end
