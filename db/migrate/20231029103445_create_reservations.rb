class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :expert, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :city
      t.date :date

      t.timestamps
    end
  end
end
