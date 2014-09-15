# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'skirace'
set :repo_url, 'git@192.168.1.138:skirace.git'
set :deploy_to, '/home/app/skirace'
set :deafult_env, { path: '.rvm/rubies/ruby-2.1.0/bin/:$PATH' }
set :rvm_type, :user

namespace :deploy do

  desc 'Create log file'
  task :logs do
    on roles(:app) do
      unless File.exists?(File.join(current_path, 'log', 'application.log'))
        execute "cd #{current_path} && mkdir log"
        execute "cd #{current_path} && touch log/application.log"
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      begin; execute "killall ruby"; rescue; end

      execute "cd #{current_path} && RACK_ENV=production rvmsudo bundle exec rackup"
    end
  end

  after :publishing, :logs
  after :publishing, :restart
end
