class Skirace::Application < Sinatra::Base
  post '/import' do |import_uploader|
    file = import_uploader.upload params[:datafile]
    if file.process(params[:current_contest])
      {success: true}.to_json
    else
      status 422
    end
  end
end
