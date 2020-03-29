class RenameTypeToAdminLog < ActiveRecord::Migration[6.0]
  def change

    rename_column :admin_logs, :type, :target
  end
end
