class AddFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :name, :string
    add_column :books, :author, :string
    add_column :books, :sold, :boolean
  end
end
