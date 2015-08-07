class RoleResource < ActiveRecord::Base
  validates_uniqueness_of :resource_name, scope: :role_id
  belongs_to :role
end
