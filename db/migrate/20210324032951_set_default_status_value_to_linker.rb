class SetDefaultStatusValueToLinker < ActiveRecord::Migration[6.0]
  def change
    change_column :linkers, :status, :boolean, :default => false

    Linker.update_all(status: false)
  end
end
