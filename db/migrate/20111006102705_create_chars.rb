class CreateChars < ActiveRecord::Migration
  def change
    create_table :chars do |t|
      t.string :name
      t.references :script
      t.references :sound

      t.timestamps
    end
  end
end
