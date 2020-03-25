class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, :limit => 50, null: false
      t.text :content, null: false
      t.timestamps
      # t.references :user, foreign_key: true
      t.bigint :user_id
    end
    # change_column_null :posts, :title, false
    # change_column_null :posts, :content, false
    add_index :posts, :title, unique: true
    # change_column_null :posts, :user_id, false
    add_foreign_key :posts,:users
  end
end
