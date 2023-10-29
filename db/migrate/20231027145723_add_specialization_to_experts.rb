class AddSpecializationToExperts < ActiveRecord::Migration[7.1]
  def change
    add_reference :experts, :specialization, null: false, foreign_key: true
  end
end
