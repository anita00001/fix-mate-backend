class ChangeColumnTypeInReservations < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :expert_id, :integer
  end
end
