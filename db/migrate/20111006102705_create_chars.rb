class CreateChars < ActiveRecord::Migration
  def change
    create_table :chars do |t|
      t.string :name
      t.text :description
      t.references :script
      t.references :glyph

      t.timestamps
    end
  end
end
