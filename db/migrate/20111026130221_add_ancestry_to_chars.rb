class AddAncestryToChars < ActiveRecord::Migration
  def change
    add_column :chars, :ancestry, :string

    add_index :chars, :ancestry
  end
end
