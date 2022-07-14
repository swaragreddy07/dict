class CreateUserkeys < ActiveRecord::Migration[7.0]
  def change
    create_table :userkeys do |t|
      t.string :key
      t.date :added_on
      t.integer :count
      t.integer :user_id

      t.timestamps
    end
  end
end
