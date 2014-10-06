class JsEditor < ActiveRecord::Base
  attr_accessible :data_entry_id, :js_event, :js_code
  
  belongs_to :data_entry
end
