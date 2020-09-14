class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.integer         :priority_id,   null: false
      t.string          :program,       null: false
      t.references      :plan,          null: false, foreign_key: true
      t.timestamps
    end     
  end
end
