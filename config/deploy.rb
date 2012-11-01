require "./lib/hash_symbolizer"
require "rvm/capistrano"
require 'bundler/capistrano'
load 'deploy/assets'

CONFIG = YAML.load(File.read(File.expand_path("config/deploy.yml"))).extend(HashSymbolizer).symbolize_keys

set :rvm_type,        :system
set :rvm_ruby_string, '1.9.3'
set :keep_releases,   3
set :application,     CONFIG.fetch(:application)
set :repository,      CONFIG.fetch(:repository)
set :branch,          CONFIG.fetch(:branch)
set :scm,             CONFIG.fetch(:scm)
set :deploy_server,   CONFIG.fetch(:server)
set :user,            CONFIG.fetch(:username)
set :login,           CONFIG.fetch(:login)

set :bundle_without,  [:development, :test]
set :deploy_to,       "/home/#{user}/projects/#{application}"
set :bundle_dir,      "#{shared_path}/gems"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{application}.#{login}.pid"
set :use_sudo,        false

server deploy_server, :app, :web, :db, :primary => true

set :rake,              "bundle exec rake"
set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"

# Hooks
before 'deploy:finalize_update', :set_current_release, :copy_database_config, :copy_environment_config

# Tasks
task :copy_environment_config, roles => :app do
  db_config = "#{shared_path}/environments/production.yml"
  run "cp #{db_config} #{release_path}/config/environments/production.yml"
end

task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

task :set_current_release, :roles => :app do
  set :current_release, latest_release
end

namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end
