class CreateRoleResources < ActiveRecord::Migration
  def change
    create_table :role_resources do |t|
      t.references :role, index: true
      t.string :resource_name

      t.timestamps
    end
  end
end
