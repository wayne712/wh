class CreateAdminLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_logs do |t|

      t.belongs_to :admin_user
      t.integer :type
      t.integer :action
      t.string :action_value
      t.timestamps
    end
  end
end
