class DropKeys < ActiveRecord::Migration[7.0]
    def change
      drop_table :keys
    end
end