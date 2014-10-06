class Task < ActiveRecord::Base
  attr_accessible :user_id, :iser_id_source, :date_due, :date_created, :user_id_created, :date_completed, :user_id_completed, :node_id

  belongs_to :node
  belongs_to :user
end
