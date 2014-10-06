#############################################################
# Application
#############################################################

set :application, "workflow"
set :deploy_to, "/var/www/rails/#{application}"

#############################################################
# Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, false

#############################################################
# Servers
#############################################################

set :user, 'carmatec'
set :domain, "69.50.212.209"
#set :port, "22"
server domain, :app, :web
role :db, domain, :primary => true



#############################################################
# Subversion
#############################################################

set :repository,  "git@github.com:RailsCarma/workflow.git"
set :scm, 'git'

#############################################################
# Passenger
#############################################################

namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  after "deploy:update_code", :link_production_db
end

#after :deploy, "deploy:restart"

# database.yml task
desc "Link in the production database.yml"
task :link_production_db do
  #run "ln -nfs #{deploy_to}/shared/lib/postcodes.csv #{release_path}/lib/tasks/postcodes.csv"
  #  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  #  run "ln -nfs #{deploy_to }/shared/db/sphinx #{release_path}/db/sphinx"
  #  run "ln -nfs #{deploy_to}/shared/config/sphinx.yml #{release_path}/config/sphinx.yml"
  #  run "ln -nfs #{deploy_to}/shared/uploads #{release_path}/public/uploads"
  #  run "ln -nfs #{deploy_to}/shared/public/system #{release_path}/public/system"
  #run "ln -nfs #{deploy_to}/shared/config/deploy.rb #{release_path}/config/deploy.rb"
end
