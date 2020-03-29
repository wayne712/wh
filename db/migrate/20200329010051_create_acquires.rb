class CreateAcquires < ActiveRecord::Migration[6.0]
  def change
    create_table :acquires do |t|

      t.belongs_to :user, foreign_key: true
      t.belongs_to :item
      t.integer :quantity, null: false, default: 1
      t.timestamps
    end
  end
end
