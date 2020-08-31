class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string     :title,              null: false
      t.string     :destination,        null: false
      t.date       :departure_day    
      t.date       :return_day       
      t.string     :hotel            
      t.text       :hotel_memo       
      t.integer    :transportation_id
      t.string     :start_place
      t.text       :ticket
      t.references :user,             null:false, foreign_key:true        
      t.references :group,            null:false, foreign_key:true        
      t.references :candidate,        foreign_key:true        
      t.timestamps
    end
  end
end
