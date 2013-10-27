require 'sinatra/base'

class SkiRace < Sinatra::Base
  get '/' do
    'hello world!'
  end
end
