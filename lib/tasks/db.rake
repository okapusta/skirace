namespace :db do
  desc "Seed database with data"
  task :seed do
    ruby Dir['./db/seeds.rb'].shift
  end
end