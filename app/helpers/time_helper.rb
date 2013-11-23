module TimeHelper
  def time_human_readable_format(time)
    time.strftime("%H:%R:%S")
  end

  def result_time_human_readable(result)
    Time.at(round_time(result)).gmtime.strftime('%R:%S')
  end

  def round_time(result)
    result.to_i
  end
end