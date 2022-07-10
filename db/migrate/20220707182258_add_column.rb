class AddColumn< ActiveRecord::Migration[7.0]
    def change
        add_column :users , :added_on, :string
    end
  end