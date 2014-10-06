class DataEntry < ActiveRecord::Base
  attr_accessible :node_id, :field_type, :name, :location, :rank, :multi, :must_fill, :role_id, :update_db, :select_db

  belongs_to :role
  has_many :js_editors
  belongs_to :node

  NODE_TYPES=["Data Entry","Decision","Information"]
end
