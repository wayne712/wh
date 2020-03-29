class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.belongs_to :admin_user
      t.string :name, null: false
      t.integer :stock, null: false, default: 0
      t.timestamps
    end
  end
end
