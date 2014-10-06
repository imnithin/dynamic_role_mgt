class Role < ActiveRecord::Base

	attr_accessible :name, :description

	validates :name, presence: true, uniqueness: true

	has_many :users
	has_many :data_entries
	has_one :role_alternative
	has_one :node

	has_many :permitted_roles, :dependent => :destroy
	has_many :permission_methods, :through => :permitted_roles

	after_create :permit_users_index_action

	def permit_users_index_action
		unless self.name == "admin"
			pc = PermissionClass.find_by_name('Users')
			pm_id = pc.permission_methods.find_by_name('index').id if pc
			PermittedRole.find_or_create_by_role_id_and_permission_method_id(role_id: self.id, permission_method_id: pm_id.to_i) 
		end
	end

	def set_permissions(selected_permissions)
		selected_permissions += permit_users_index_action.permission_method_id.to_s.split 
		permissions = selected_permissions.uniq
		if permissions and !permissions.empty?
			permissions_to_delete = []
			self.permission_methods.each do |p|
				if permissions.include?(p.id.to_s)
					permissions.delete_if {|s_p| s_p == p.id.to_s}
				else
					permissions_to_delete << p
				end
			end
			unless permissions.empty?
				permissions.each do |permission_id|
					PermittedRole.create(role_id: self.id, permission_method_id: permission_id.to_i)
				end
			end
			unless permissions_to_delete.empty?
				permissions_to_delete.each do |p_t_d|
					PermittedRole.where("role_id = #{self.id} and permission_method_id = #{p_t_d.id}").first.destroy
				end
			end
		else
			self.permitted_roles.destroy_all
		end
	end

end
