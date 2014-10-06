class Information < ActiveRecord::Base
  attr_accessible :node_id
  
  belongs_to :node
end
