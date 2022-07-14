class RenameExam < ActiveRecord::Migration[7.0]
    def change
      rename_column :words, :exam, :example
    end
end