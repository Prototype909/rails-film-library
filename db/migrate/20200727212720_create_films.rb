class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.string :director
      t.integer :year
      t.text :description
      
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
