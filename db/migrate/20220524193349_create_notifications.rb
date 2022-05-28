class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :receiver, null: false
      t.references :order, null: false, foreign_key: true
      t.references :sender, null: false
      t.boolean :viewed

      t.timestamps
    end
  end
end
