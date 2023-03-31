class RenameUserIdtoAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :auther_id, :author_id
  end
end
