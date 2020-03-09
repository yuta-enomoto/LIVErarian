class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :fee                   
      t.string :station            
      t.string :venue             
      t.datetime :date_time,            null: false
      t.boolean :status,                null: false, default: true
      t.integer :form_id,               null: false, foreign_key: true
      t.integer :how_long_id,           null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true
      t.references :artist,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
