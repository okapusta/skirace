class Skirace::Application < Sinatra::Base
  get '/export' do |contestant_presenter, contest_repository|
    env['warden'].authenticate!

    contestants = contest_repository.get(params[:contest]).contestants
    case params[:format]
    when 'json'
      content_type 'application/json'
      attachment 'export.json'
      contestant_presenter.as_json(contestants)
    when 'csv'
      content_type 'text/csv'
      attachment 'export.csv'
      contestant_presenter.as_csv(contestants)
    when 'xml'
      content_type 'text/xml'
      attachment 'export.xml'
      contestant_presenter.as_xml(contestants)
    else
      status 404
    end
  end
end