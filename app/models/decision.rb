class Decision < ActiveRecord::Base
  attr_accessible :node_id, :criteria, :value1, :value2, :value3, :type

  belongs_to :node
end
