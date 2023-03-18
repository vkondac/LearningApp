class AddColumnsToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :name, :string
  end
end
