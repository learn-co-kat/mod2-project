class CreateStoryTags < ActiveRecord::Migration[6.0]
  def change
    create_table :story_tags do |t|
      t.integer :tag_id
      t.integer :story_id

      t.timestamps
    end
  end
end
