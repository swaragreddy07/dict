class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :def
      t.string :exam
      t.string :related

      t.timestamps
    end
  end
end
