class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.integer     :budget_id,           null: false
      t.string      :night,               null: false
      t.string      :destination,         null: false
      t.text        :reason             
      t.integer     :transportation_id
      t.integer     :take_time        
      t.string      :trans_cost    
      t.boolean     :decision
      t.references  :user,                null: false, foreign_key: true 
      t.references  :group,               null: false, foreign_key: true 
      t.timestamps
    end
  end
end
