class AddDescriptionToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :description, :text
  end
end
