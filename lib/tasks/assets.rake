namespace :assets do
  desc 'precompile assets'
  task :precompile do
    sprockets = Skirace::Application.settings.sprockets
    
    ['application.js', 'application.css'].each do |asset|
      file = File.join(Skirace::Application.settings.assets_path, asset)
      asset = sprockets[asset]
      asset.write_to(file)
    end
  end
end