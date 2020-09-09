class CreateDictionaries < ActiveRecord::Migration[6.0]
  def change
    create_table :dictionaries do |t|
      t.string     :language
      t.string     :japanese,         null:false
      t.string     :translation,      null:false 
      t.references :plan,             null:false, foreign_key: true
      t.references :user,             null:false, foreign_key: true
      t.references :group,            null:false, foreign_key: true
      t.timestamps
    end
  end
end
