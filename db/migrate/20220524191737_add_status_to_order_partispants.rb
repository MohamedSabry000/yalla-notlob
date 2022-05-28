class AddStatusToOrderPartispants < ActiveRecord::Migration[7.0]
  def change
    add_column :order_partispants, :status, :string
  end
end
