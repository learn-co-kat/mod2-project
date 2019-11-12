class CreateWriters < ActiveRecord::Migration[6.0]
  def change
    create_table :writers do |t|
      t.string :name
      t.string :nationality
      t.integer :age

      t.timestamps
    end
  end
end
