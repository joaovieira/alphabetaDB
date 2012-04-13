class AddFileToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :file, :string
  end
end
