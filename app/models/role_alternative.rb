class RoleAlternative < ActiveRecord::Base
  attr_accessible :role_id, :role_id_alt

  belongs_to :role
end
