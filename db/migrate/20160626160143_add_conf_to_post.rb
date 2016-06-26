class AddConfToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :confirmar, :integer
  end
end
