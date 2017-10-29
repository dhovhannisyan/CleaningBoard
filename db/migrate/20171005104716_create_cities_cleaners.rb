class CreateCitiesCleaners < ActiveRecord::Migration[5.1]
  def change
    create_table :cities_cleaners do |t|
      t.references :city, foreign_key: true
      t.references :cleaner, foreign_key: true
    end
    add_index :cities_cleaners, [:city_id, :cleanr_id]#, unique: true 
  end
end
