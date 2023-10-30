class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :experts, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.text :city
      t.date :date

      t.timestamps
    end
  end
end
