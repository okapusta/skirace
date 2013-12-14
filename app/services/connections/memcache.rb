class Connections::MemcacheConnection
  takes :options, :dalli_client


  def client
    @client ||= dalli_client.new(options.memcache_server, options.memcache_client)
  end
end