class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string :title,       null: false
      t.date :date,          null: false
      t.string :person,      null: false
      t.string :place,       null: false
      t.text :description,   null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
