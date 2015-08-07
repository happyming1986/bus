class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  RESERVED = [:admin]
  has_and_belongs_to_many :users, :join_table => :users_roles
  has_many :role_resources, dependent: :destroy

  def self.all_without_reserved
    self.all.reject do |role|
      RESERVED.include?(role.name)
    end
  end
end
