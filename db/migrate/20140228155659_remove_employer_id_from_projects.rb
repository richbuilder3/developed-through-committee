class RemoveEmployerIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :employer_id, :integer
  end
end
