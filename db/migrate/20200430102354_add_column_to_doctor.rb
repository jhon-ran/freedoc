class AddColumnToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :zip_code, :string
  end
end
