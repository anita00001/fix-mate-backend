class CreateExperts < ActiveRecord::Migration[7.1]
  def change
    create_table :experts do |t|

      t.timestamps
    end
  end
end
