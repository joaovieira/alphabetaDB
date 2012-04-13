class RemoveDatesFromGlyphs < ActiveRecord::Migration
  def up
    remove_column :glyphs, :beginDate
    remove_column :glyphs, :endDate
  end

  def down
    remove_column :glyphs, :beginDate, :string
    remove_column :glyphs, :endDate, :string
  end
end
