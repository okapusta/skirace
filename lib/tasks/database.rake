namespace :db do
  desc "Seed database with data"
  task :seed do
    ruby Dir['./db/seeds.rb'].shift
  end

  desc "Migrate database"
  task :migrate do
  	%x(bundle exec sequel -m db/migrations/ sqlite://db/database.sqlite)
  end

  desc "Drop database"
  task :drop do 
  	%x(rm -f db/database.sqlite)
  end

  desc "Restore clean state"
  task :clean_state do
    ['db:drop', 'db:migrate'].each do |task|
      Rake::Task[task].invoke
    end
  end
end