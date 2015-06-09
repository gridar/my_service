# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'miimosa'
set :repo_url, 'git@git.tymate.com:tymate/miimosa.git'

set :scm, :git

set :linked_dirs, %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)
set :linked_files, %w(config/database.yml config/unicorn.rb config/application.yml)
 
set :ssh_options, forward_agent: true

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Fix permission'
  task :fix_permissions do
    on roles(:app), in: :sequence, wait: 5 do
      execute :chmod, '-R o+r', release_path.join('public')
    end
  end

  after :deploy, :fix_permissions

  after :publishing, :restart
end

require 'appsignal/capistrano'