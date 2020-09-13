class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.references   :user,         null: false, foreign_key: true
      t.references   :bring,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
