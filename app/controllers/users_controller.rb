class UsersController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  before_filter :set_user, :only => [:edit_user, :update_user, :destroy]

  def index
    @flows = Flow.paginate(page: params[:page], per_page: 6)
  end

  def show_db_settings
  	@line_wise = File.read("config/database.yml").split("\n")
  end

  def save_db_settings
  	if params[:host]=="ip"
      params[:host]=params[:host_ipentered]
    end
    @i_db=@e_db="  adapter:  #{params[:adapter]}\n  host:  #{params[:host]}\n"
    params[:"#{Rails.env}"].each do |x|
      @i_db+=("  "+x[0].gsub('"','')+":  "+x[1])+"\n"
    end
    params[:external].each do |x|
      @e_db+=("  "+x[0].gsub('"','')+":  "+x[1])+"\n"
    end
    File.open("#{Rails.root}"+"/config/database.yml","w+") do |f|
      f.write("#{Rails.env}:\n#{@i_db}\n\n\nexternal:\n#{@e_db}")
    end
    dbconfig = YAML.load(File.read("#{Rails.root}"+'/config/database.yml'))
    ActiveRecord::Base.establish_connection(dbconfig[Rails.env])
    redirect_to root_path
  end

  def list_users
    @users = User.where("id != #{current_user.id}")
  end

  def update_user
    if @user.update_attributes(params[:user])
      redirect_to root_path
    else
      render 'edit_user'
    end
  end

  def edit_user
    @roles = Role.where("name != 'admin' ")
  end
  
  def destroy
    if @user.destroy
      flash[:notice] = "User deletion successfull"
    else
      flash[:error] = "Something went wrong inform ADMIN"
    end
    redirect_to root_path
  end

  private
  def set_user
   @user = User.find(params[:id])
 end

end
