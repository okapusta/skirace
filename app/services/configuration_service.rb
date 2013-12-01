class ConfigurationService
  takes :yaml, :options, :file, :dir, :hash

  def get
    config = hash.dup
    dir[file.expand_path(options.application_config, __FILE__)].each do |path|
      configuration_file = file.open(path)    
      next unless file.exists?(configuration_file)
  
      config.deep_merge!(yaml.load_file(configuration_file))
    end
    hash.with_indifferent_access(config)
  end
end