class PermissionMethod < ActiveRecord::Base

   attr_accessible :name, :permission_class_id

   validates :name, :presence => true
   validates_numericality_of :permission_class_id

   belongs_to :permission_class, :foreign_key => :permission_class_id
   has_many :permitted_roles, :dependent => :destroy
   has_many :roles, :through => :permitted_roles, :dependent => :destroy
   
end
