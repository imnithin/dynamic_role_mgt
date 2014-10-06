class NodesController < ApplicationController
  # GET /nodes
  # GET /nodes.json

  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @nodes = Node.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nodes }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    @node = Node.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.json
  def new
    @node = Node.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @edit=1
    @node = Node.find(params[:id])
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(params[:node])

      if @node.save
        flash[:notice] = "Node was successfully created"
        if @node.node_type == "Data Entry"
          redirect_to new_data_entry_node_pages_path(:node=>@node.id)
        elsif @node.node_type == "Decision"
          redirect_to new_decision_node_pages_path
        else
          redirect_to new_information_node_pages_path
        end
      else
        render new_node
      end
  end

  # PUT /nodes/1
  # PUT /nodes/1.json
  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to @node, notice: 'Node was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node = Node.find(params[:id])
    @node.destroy

    respond_to do |format|
      format.html { redirect_to nodes_url }
      format.json { head :no_content }
    end
  end

  def filter_nodes
    @f=Flow.find(params[:flow])
    if params[:id]
      @node=Node.find(params[:id])
      @edit=1
    end
    render :partial=>'filter_nodes',@objects=>@f.nodes
  end

  def filter_decision_value
    @parent_node_type = Node.find(params[:node_id]).node_type
  end
end
