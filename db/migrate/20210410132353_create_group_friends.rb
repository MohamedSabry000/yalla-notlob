class CreateGroupFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :group_friends do |t|
      t.references :group, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
