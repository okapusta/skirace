require 'sinatra/base'

module Sprockets
  module Helpers
    def stylesheet_tag
      if production?
        "<link rel='stylesheet' href='/assets/application.min.css' type='text/css' media='all' />"
      else
        "<link rel='stylesheet' href='/assets/application.css' type='text/css' media='all' />"
      end
    end

    def javascript_tag
      if production?
        "<script src='/assets/application.min.js' type='text/javascript'></script>"
      else
        "<script src='/assets/application.js' type='text/javascript'></script>"
      end
    end
  end
end