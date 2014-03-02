class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :story
      t.integer :developer_id
      t.string :email
      t.string :work

      t.timestamps
    end
  end
end
