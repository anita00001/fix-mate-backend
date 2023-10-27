class CreateSpecializations < ActiveRecord::Migration[7.1]
  def change
    create_table :specializations do |t|
      t.text :name
      t.text :description
      t.text :icon

      t.timestamps
    end
  end
end
