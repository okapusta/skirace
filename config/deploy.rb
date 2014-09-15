# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'skirace'
set :repo_url, 'git@192.168.1.138:skirace.git'
set :deploy_to, '/home/app/skirace'

namespace :deploy do

  desc 'Symlink db'
  task :db do
    on roles(:app) do
      execute "ln -s #{shared_path}/db/database.sqlite #{current_path}/db/database.sqlite"
    end
  end

  desc 'Symlink log file'
  task :logs do
    on roles(:app) do
      execute "ln -s #{shared_path}/log #{current_path}/log"
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      begin; execute "sudo killall -s SIGKILL ruby"; rescue; end;
      command = <<-CMD
        cd #{current_path} && \
        source ~/.rvm/scripts/rvm && \
        rvmsudo bundle exec rackup -D -E production
      CMD
      execute command
    end
  end
  after :publishing, :db 
  after :publishing, :logs
  after :publishing, :restart
end
