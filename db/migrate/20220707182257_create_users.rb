class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :plan
      t.string :date
      t.string :keys
      t.string :count
      t.string :added_on
      t.timestamps
    end 
  end
end
