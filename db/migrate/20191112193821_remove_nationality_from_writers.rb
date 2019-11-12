class RemoveNationalityFromWriters < ActiveRecord::Migration[6.0]
  def change
    remove_column :writers, :nationality, :string
  end
end
