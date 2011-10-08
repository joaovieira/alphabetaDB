class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :name
      t.string :symbol
      t.string :sound
      t.references :char

      t.timestamps
    end
  end
end
