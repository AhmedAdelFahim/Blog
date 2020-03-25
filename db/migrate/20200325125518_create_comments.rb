class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.timestamps
      t.bigint :user_id
    end
    add_foreign_key :comments,:users
  end
end
