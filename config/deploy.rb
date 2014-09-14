# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'skirace'
set :repo_url, 'git@192.168.1.138:skirace.git'
set :deploy_to, '/home/app/skirace'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && rvmsudo bundle exec rackup"
    end
  end

  after :publishing, :restart
end
