class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :id_serie
      t.integer :id_status
      t.integer :vote_p
      t.integer :vote_n
      t.integer :id_type

      t.timestamps null: false
    end
  end
end
