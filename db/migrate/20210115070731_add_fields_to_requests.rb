class AddFieldsToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :first_name, :string
    add_column :requests, :last_name, :string
    add_column :requests, :phone_number, :string
    add_column :requests, :biography, :string
    add_column :requests, :email, :string
  end
end
