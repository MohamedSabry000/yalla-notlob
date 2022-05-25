class CreateUserAuths < ActiveRecord::Migration[7.0]
  def change
    create_table :user_auths do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
