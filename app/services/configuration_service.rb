class ConfigurationService
  takes :yaml, :file, :dir, :hash

  def get(include_root = false, default_namespace = 'application')
    config = hash.dup
    dir[file.expand_path(application_config, __FILE__)].each do |path|
      configuration_file = file.open(path)    
      next unless file.exists?(configuration_file)
  
      config.deep_merge!(yaml.load_file(configuration_file))
    end
    hash.with_indifferent_access(
        extract_keys(include_root, 
          default_namespace,
          config)
        )
  end

  def get_config
    get[:config]
  end

  def get_locale
    get[:locale]
  end

  def get_rpi_config
    get(false, 'raspberry_pi')[:config]
  end

  private

    def extract_keys(include_root, default_namespace, config)
      return config[config_root][default_namespace] unless include_root
      config
    end

    def application_config
      "#{current_path}/config/**/*.yml"
    end

    def config_root
      'skirace'
    end

    def current_path
      ENV['PWD'] || ENV['BUNDLE_GEMFILE'].gsub('Gemfile','')
    end
end