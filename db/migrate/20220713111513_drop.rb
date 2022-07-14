class Drop < ActiveRecord::Migration[7.0]
    def change
        drop_table :numbers
    end

  end
  