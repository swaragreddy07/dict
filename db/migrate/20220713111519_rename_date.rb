class RenameDate < ActiveRecord::Migration[7.0]
    def change
      rename_column :users, :date, :last_activity_on
    end
  end