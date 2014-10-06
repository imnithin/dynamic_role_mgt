class PermissionClass < ActiveRecord::Base

	attr_accessible :name

	validates :name, presence: :true, uniqueness: :true

	has_many :permission_methods, dependent: :destroy
	
end
