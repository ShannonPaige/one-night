class AddColumnsToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :name, :string
    add_column :favorites, :address, :string
    add_column :favorites, :image_url, :string
  end
end
