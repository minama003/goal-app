class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.text  :task   ,null: false
      t.date  :limit    ,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
