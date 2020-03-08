class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name,                   null: false
      t.string :image,                  null: false
      t.string :active_place,           null: false
      t.text :introduction,             null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
