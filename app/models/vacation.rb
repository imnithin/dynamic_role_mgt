class Vacation < ActiveRecord::Base
  attr_accessible :user_id, :description, :start_date

  belongs_to :user
end
