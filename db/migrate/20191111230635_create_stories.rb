class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :content
      t.string :subject
      t.integer :writer_id
      t.integer :country_id

      t.timestamps
    end
  end
end
