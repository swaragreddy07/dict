class RenameCount < ActiveRecord::Migration[7.0]
    def change
      rename_column :userkeys, :count, :total_key_usage
    end
  end