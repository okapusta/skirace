class TimeService
  takes :time
  
  def format(seconds)
    time.at(seconds).gmtime.strftime('%R:%S') 
  end
end