class RenameTotal < ActiveRecord::Migration[7.0]
    def change
      rename_column :users, :total, :total_api_calls_today
    end
  end