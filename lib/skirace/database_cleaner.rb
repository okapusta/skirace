class Skirace::DatabaseCleaner
  class << self
    def invoke
      if database_size > 1000
        Rake::Task['db:clean_state'].invoke   

        symlink_database
      end
      create_default_user
    end

    private

      def database_size 
        File.size(File.join('db','database.sqlite')) / 10**6.to_f
      end

      def symlink_database
        %x(mv #{current_location}/db/database.sqlite #{shared_location}/db/database.sqlite)
        %x(ln -s #{shared_location}/db/database.sqlite #{current_location}/db/database.sqlite)
      end

      def create_default_user
        unless User.any?
          injector.user_repository.build({'username' => 'admin', 'password' => 'password'}, 1).save
        end
      end

      def injector
        Injector.new
      end

      def shared_location
        "/home/app/skirace/shared"
      end

      def current_location
        "/home/app/skirace/current"
      end
  end
end