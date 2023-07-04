class AddImgNameToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :img_name, :string
  end
end
