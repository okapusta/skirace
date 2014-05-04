require 'securerandom'

namespace :assets do
  desc 'precompile assets'
  task :precompile do
    sprockets = Skirace::Application.settings.sprockets
    
    ['application.js', 'application.css'].each do |asset|
      name, extension = asset.split('.')
      file = File.join(Skirace::Application.settings.assets_path, "#{name}-#{SecureRandom.hex}.#{extension}")
      asset = sprockets[asset]
      asset.write_to(file)
    end
  end
end