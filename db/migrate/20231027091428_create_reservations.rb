class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :expert_id
      t.int :user_id
      t.string :city
      t.date :date

      t.timestamps
    end
  end
end
