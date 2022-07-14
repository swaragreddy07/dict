class Remove < ActiveRecord::Migration[7.0]
    def change
     remove_column :users, :added_on
     remove_column :users, :count
     remove_column :users, :keys
    end
  end
  