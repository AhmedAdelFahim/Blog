class AddIndexToComments < ActiveRecord::Migration[6.0]
  def change
    # remove_index :comments, name: "fk_rails_03de2dc08c"
    remove_foreign_key :comments,:users
    rename_column :comments, :user_id, :post_id
    add_foreign_key :comments,:posts
  end

end
