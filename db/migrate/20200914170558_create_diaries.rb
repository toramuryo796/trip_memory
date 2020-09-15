class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.integer        :specific,      null: false
      t.string         :title,         null: false
      t.text           :content,       null: false      
      t.references     :memory,        null: false, foeign_key: true
      t.references     :user,          null: false, foeign_key: true
      t.timestamps 
    end
  end
end
