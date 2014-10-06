class PermittedRole < ActiveRecord::Base

  attr_accessible :role_id, :permission_method_id

  validates_numericality_of :role_id, :permission_method_id

  belongs_to :role
  belongs_to :permission_method

end
