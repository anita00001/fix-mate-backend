class CreateExperts < ActiveRecord::Migration[7.1]
  def change
    create_table :experts do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :address
      t.integer :experience
      t.boolean :status, default: true
      t.boolean :removed, default: false
      t.text :image
      t.decimal :fee

      t.timestamps
    end
  end
end
