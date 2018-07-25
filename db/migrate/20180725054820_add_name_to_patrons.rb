class AddNameToPatrons < ActiveRecord::Migration[5.2]
  def change
    add_column :patrons, :name, :string
  end
end
