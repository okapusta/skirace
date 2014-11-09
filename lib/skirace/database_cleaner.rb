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

      # TODO: code
      def symlink_database
      end

      def create_default_user
        unless User.any?
          injector.user_repository.build({'username' => 'admin', 'password' => 'password'}, 1).save
        end
      end

      def injector
        Injector.new
      end
  end
end