class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    drop_table :bookings
    create_table :bookings do |t|
      t.references :cleaner, foreign_key: true
      t.references :client, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
