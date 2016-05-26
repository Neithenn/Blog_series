class AddImgToPost < ActiveRecord::Migration
  def change

  	add_column :posts, :img, :string
  	add_column :posts, :written_by, :string
  	add_column :posts, :desc_serie, :string

  	remove_column :posts, :vote_p
  	remove_column :posts, :vote_n
  end
end
