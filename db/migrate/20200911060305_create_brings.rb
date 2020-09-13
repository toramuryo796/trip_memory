class CreateBrings < ActiveRecord::Migration[6.0]
  def change
    create_table :brings do |t|
      t.string          :thing,    null: false
      t.references      :group,    null: false, foreign_key: true
      t.references      :plan,     null: false, foreign_key: true
      t.references      :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
