set :assets_prefix, '/assets'
set :assets_path, File.join(public_folder, assets_prefix)
      
set :sprockets, Sprockets::Environment.new(root)
