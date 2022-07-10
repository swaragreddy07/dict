class CreateNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :numbers do |t|
      t.integer :num
    end

      t.timestamps
    end
  end
end
