class Skirace::Application < Sinatra::Base
  post '/import' do |import_uploader|
    file = import_uploader.upload params[:datafile]
    if file.process
      status 200
    else
      status 422
    end
  end
end
