class ConfigurationService
  takes :yaml, :options, :file, :dir, :configuration_hash

  def get
    hash = configuration_hash
    dir[file.expand_path(options.application_config, __FILE__)].each do |path|
      configuration_file = file.open(path)    
      next unless file.exists?(configuration_file)
  
      hash.deep_merge!(yaml.load_file(configuration_file))
    end
    hash
  end
end