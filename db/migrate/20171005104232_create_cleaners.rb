class CreateCleaners < ActiveRecord::Migration[5.1]
  def change
    create_table :cleaners do |t|
      t.string :fname, null: false, default: ''
      t.string :lname, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :password, null: false, default: ''
      t.timestamps 
    end
  end
end
