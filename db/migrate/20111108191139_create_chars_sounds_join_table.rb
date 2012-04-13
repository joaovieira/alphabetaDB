class CreateCharsSoundsJoinTable < ActiveRecord::Migration
  def change
    create_table :chars_sounds, :id => false do |t|
      t.integer :char_id
      t.integer :sound_id
    end
  end
end
