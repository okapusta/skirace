caching_service.fetch('query') do
  User.find(id: @id)
end
  
