class RemoveForeignKeyConstraintFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, name: "fk_rails_403c3577f5"
  end
end
