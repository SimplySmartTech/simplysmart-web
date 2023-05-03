require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :rails_env, 'production'
set :application_name, 'simplysmart'
set :domain, 'helpdesk-stage.simplymeter.in'
set :deploy_to, '/www/simplysmart_web'
set :repository, 'git@github.com:SimplySmartTech/simplysmart-web.git'
set :branch, 'ui-setup'
set :user, 'ubuntu'
set :rvm_use_path, '/usr/local/rvm//bin/rvm'

# Optional settings:
#   set :user, 'foobar'          # Username in the server to SSH to.
#   set :port, '30000'           # SSH port number.
set :forward_agent, true     # SSH forward_agent.

# Shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# Some plugins already add folders to shared_dirs like `mina/rails` add `public/assets`, `vendor/bundle` and many more
# run `mina -d` to see all folders and files already included in `shared_dirs` and `shared_files`
#set :shared_dirs, fetch(:shared_dirs, []).push('public/assets')
set :shared_paths, ['config/database.yml', 'config/master.key','config/credentials.yml.enc','log', 'tmp', 'config/secrets.yml', "db/seeds.rb", '.env']

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use', '3.1.2@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup => :remote_environment do
  # command %{rbenv install 2.5.3 --skip-existing}
  #command %{rvm install ruby-3.1.2}
  #command %{rvm use ruby-3.1.2}
  #command %{gem install bundler}
  command %{mkdir -p "#{fetch(:deploy_to)}/shared/log"}
  command %{chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/log"}

  command %{mkdir -p "#{fetch(:deploy_to)}/shared/config/initializers"}

  command %{chmod -R g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"}
  command %{touch "#{fetch(:deploy_to)}/shared/config/credentials.yml.enc"}
  command %{chmod g+rx, u+rwx "#{fetch(:deploy_to)}/shared/config/credentials.yml.enc"}

  command %{touch "#{fetch(:deploy_to)}/shared/config/master.key"}
  command %{chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config/master.key"}

  command %{touch "#{fetch(:deploy_to)}/shared/config/database.yml"}
  command %{chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config/database.yml"}

  command %{mkdir -p "#{fetch(:deploy_to)}/shared/tmp"}
  command %{chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp"}

  command %{mkdir -p "#{fetch(:deploy_to)}/shared/tmp/pids"}
  command %{chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/pids"}

  command %{mkdir -p "#{fetch(:deploy_to)}/shared/tmp/sockets"}
  command %{chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/sockets"}

  command %{touch "#{fetch(:deploy_to)}/shared/.env"}
  command %{chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/.env"}
end

desc "Deploys the current version to the server."
task :deploy => :remote_environment do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    command %{yarn build}
    command %{yarn build:css}
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
