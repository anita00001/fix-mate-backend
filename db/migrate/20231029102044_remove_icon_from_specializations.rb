class RemoveIconFromSpecializations < ActiveRecord::Migration[7.1]
  def change
      remove_column :specializations, :icon, :text
  end
end
