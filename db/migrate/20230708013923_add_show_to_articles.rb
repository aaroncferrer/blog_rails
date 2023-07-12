class AddShowToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :show, :string
  end
end
