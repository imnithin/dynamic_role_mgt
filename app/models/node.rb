class Node < ActiveRecord::Base
  attr_accessible :flow_id, :name, :node_id_parent, :duration, :node_id_task_starter, :parent_value, :node_type, :role_id, :sql

  belongs_to :flow
  belongs_to :role
  has_many :tasks
  has_many :data_entries
  has_one :decision
  has_one :information

  validates :name, :presence => true, :uniqueness => true
  validates :role_id, :presence => true
  validates :flow_id, :presence => true
  validates :node_type, :presence => true
  
end
