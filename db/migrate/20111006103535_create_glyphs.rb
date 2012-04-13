class CreateGlyphs < ActiveRecord::Migration
  def change
    create_table :glyphs do |t|
      t.string :unicode
      t.string :beginDate
      t.string :endDate

      t.timestamps
    end
  end
end
