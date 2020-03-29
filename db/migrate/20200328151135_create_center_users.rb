class CreateCenterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :center_users do |t|

      t.timestamps
    end
  end
end
