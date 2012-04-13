class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.string :username

      t.timestamps
    end

    add_index :users, :username,                :unique => true
  end

end
