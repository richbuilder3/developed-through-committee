class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :email
      t.text :description
      t.integer :employer_id

      t.timestamps
    end
  end
end
