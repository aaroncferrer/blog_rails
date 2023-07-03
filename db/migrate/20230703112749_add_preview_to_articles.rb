class AddPreviewToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :preview, :text
  end
end
