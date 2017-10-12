class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :fname, null: false, default: ''
      t.string :lname, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :password, null: false, default: ''
      t.timestamps null: false
    end
    add_column :clients, :login, :string
  end
end
