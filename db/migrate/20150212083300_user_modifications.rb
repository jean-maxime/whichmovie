class UserModifications < ActiveRecord::Migration
  def change
    add_column :users, :pseudo, :string
    add_column :users, :image, :string
  end
end
