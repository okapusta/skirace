namespace :application do
  
  def my_injector
    @injector = Injector.new
  end
  
  desc "Create default admin user"
  task :create_admin_user do

    user = my_injector.user_repository.build({'username' => 'admin', 'password' => 'password'}, 1)
    if my_injector.user_repository.save(user)
      puts "Created admin user admin//password"
    end
  end
end