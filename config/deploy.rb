require "rvm/capistrano"
require 'bundler/capistrano'

CONFIG = YAML.load(File.read(File.expand_path("config/deploy.yml")))

set :rvm_type, :system
set :rvm_ruby_string, '1.9.3'
set :application, CONFIG['application']
set :repository,  CONFIG['repository']
set :scm, CONFIG['scm']

dpath = "/home/#{CONFIG['username']}/projects/#{application}"

set :user, CONFIG['username']
set :use_sudo, false
set :deploy_to, dpath

server CONFIG['server'], :app, :web, :db, :primary => true

after "deploy:update_code", :copy_database_config, :copy_environment_config

task :copy_environment_config, roles => :app do
  db_config = "#{shared_path}/environments/production.yml"
  run "cp #{db_config} #{release_path}/config/environments/production.yml"
end

task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

set :unicorn_rails, "/var/lib/gems/1.8/bin/unicorn_rails"
set :unicorn_conf, "/etc/unicorn/#{CONFIG['application_fullname']}.rb"
set :unicorn_pid, "/var/run/unicorn/#{CONFIG['application_fullname']}.pid"

# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run "#{unicorn_rails} -Dc #{unicorn_conf}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_rails} -Dc #{unicorn_conf}"
  end
end
