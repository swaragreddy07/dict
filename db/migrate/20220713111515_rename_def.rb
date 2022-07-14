class RenameDef < ActiveRecord::Migration[7.0]
    def change
      rename_column :words, :def, :definition
    end
end