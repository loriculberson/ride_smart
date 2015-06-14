class ChangeColumnNameInUser < ActiveRecord::Migration
  def change
    rename_column :users, :twitter_username, :nickname
    rename_column :users, :image, :image_url
    add_column :users, :provider, :string
  end
end
