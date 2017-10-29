class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :cleaner, foreign_key: true
      t.references :client, foreign_key: true
      t.references :city, foreign_key: true
      t.date :date
      t.string :time
      t.boolean :read

      t.timestamps
    end
  end
end
