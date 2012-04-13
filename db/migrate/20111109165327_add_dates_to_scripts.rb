class AddDatesToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :beginDate, :string
    add_column :scripts, :endDate, :string
  end
end
