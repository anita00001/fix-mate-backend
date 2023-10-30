class RemoveImageFromExperts < ActiveRecord::Migration[7.1]
  def change
     remove_column :experts, :image, :text
  end
end
