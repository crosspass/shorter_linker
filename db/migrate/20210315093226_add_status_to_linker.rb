class AddStatusToLinker < ActiveRecord::Migration[6.0]
  def change
    add_column :linkers, :status, :boolean, index: true
  end
end
