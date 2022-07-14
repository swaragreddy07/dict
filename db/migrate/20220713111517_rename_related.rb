class RenameRelated < ActiveRecord::Migration[7.0]
    def change
      rename_column :words, :related, :relatedwords
    end
end