class Options

  takes :configuration_service, :hash

  def capacitor
    OpenStruct.new(pin: 7)
  end

  def memcache_server
    configuration_service.get_config[:memcache_server]
  end

  def memcache_client
    hash.symbolize_keys!(
      configuration_service.get_config[:memcache_options]
      )
  end

  def password_cost
    10
  end

  def activation_threshold
    2
  end
end