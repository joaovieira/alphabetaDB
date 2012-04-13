class RenameSoundInSounds < ActiveRecord::Migration
  def change
    rename_column :sounds, :sound, :name
  end
end
