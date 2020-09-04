class CreateDayHows < ActiveRecord::Migration[6.0]
  def change
    create_table :day_hows do |t|
      t.integer     :passed,       null: false
      t.references  :plan,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
