class Presenters::UserPresenter
  
  def as_json(collection)
    collection.map do |user|
     {
        id:   user.id,
        login: user.username,
        role: user.role_id,
        auth_token: user.auth_token
      }
    end.to_json
  end

end