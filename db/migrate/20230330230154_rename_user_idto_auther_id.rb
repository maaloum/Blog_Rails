class RenameUserIdtoAutherId < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :auther_id
  end
end
