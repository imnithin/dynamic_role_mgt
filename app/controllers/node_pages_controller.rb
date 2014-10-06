class NodePagesController < ApplicationController
  
   before_filter :authenticate_user!
   load_and_authorize_resource

  def new_data_entry
    @node = Node.find(params[:node])
  end

  def save_data_entry
    params["data_entry"].each do |de|
      @data_entry = DataEntry.new(de)
      @data_entry.save
    end
    flash[:notice] = "Data Entry has been successfully created"
    redirect_to nodes_path
  end

  def save_decision
    @decision = Decision.new(params[:decision])
    if @decision.save
      flash[:notice] = "Decision has been successfully created"
      redirect_to nodes_path
    end
  end

  def list_task
    @task = Node.where("role_id=? and node_type=? and 'sql' is not null",current_user.role,"Data Entry")
  end

  def new_task
    @node = Node.find(params[:id])
    @de = @node.data_entries.collect(&:update_db)
    @db = ActiveRecord::Base.establish_connection(:external).connection.execute(@node.sql)
    ActiveRecord::Base.establish_connection(Rails.env.to_sym)
  end

  def save_task
  end
  
end
