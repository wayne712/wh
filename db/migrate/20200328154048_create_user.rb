class CreateUser < ActiveRecord::Migration[6.0]
  def change
    drop_table :center_users
    create_table :users do |t|
      t.string :name, null: false
      t.integer :department
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
