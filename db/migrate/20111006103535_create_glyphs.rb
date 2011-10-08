class CreateGlyphs < ActiveRecord::Migration
  def change
    create_table :glyphs do |t|
      t.string :image
      t.date :beginDate
      t.date :endDate

      t.timestamps
    end
  end
end
