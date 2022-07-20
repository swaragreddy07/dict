class ChangeDate < ActiveRecord::Migration[7.0]
    def change
      change_column :users, :date, :date
    end
  end