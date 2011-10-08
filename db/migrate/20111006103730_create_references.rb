class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :author
      t.string :publisher
      t.string :title
      t.integer :year
      t.string :url

      t.timestamps
    end
  end
end
