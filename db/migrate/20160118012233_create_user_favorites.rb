class CreateUserFavorites < ActiveRecord::Migration
  def change
    create_table :user_favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :favorite, index: true, foreign_key: true
    end
  end
end
