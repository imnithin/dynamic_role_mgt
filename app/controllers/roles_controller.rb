class RolesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  before_filter :set_role, :only => [:show, :edit, :update, :destroy, :show_permissions, :set_permissions ]

  def index
    @roles = Role.where("name != 'admin'")
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
      redirect_to @role, notice: 'Role was successfully created.' 
    else
      render action: "new"
    end
  end

  def show
  end

  def update
    if @role.update_attributes(params[:role])
      redirect_to @role, notice: 'Role was successfully updated.' 
    else
     render action: "edit" 
   end
 end

 def destroy
  unless @role.users.present?
    @role.destroy  
    redirect_to roles_url , notice: 'Role was successfully deleted.' 
  else
    redirect_to roles_url , alert: 'Role is already set to user' 
  end
end

def show_permissions
end

def set_permissions
  begin
    @role.set_permissions(params[:permissions]) if params[:permissions]
    flash[:notice] = "Permissions assigned successfully"
  rescue
    flash[:alert] = "Error occured while assigning permissions, please try agin"
  end
  redirect_to roles_path
end

private 

def set_role
  @role = Role.where(["id = ? and name != ?", params[:id],  'admin']).first
end

end