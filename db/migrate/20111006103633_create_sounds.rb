class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :symbol
      t.string :sound

      t.timestamps
    end
  end
end
