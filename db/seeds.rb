# coding: utf-8

require_relative '../app/models/contestant'

MIN_RACE_TIME = 3*60
MAX_RACE_TIME = 5*60


CONTESTANT = {
  names: ['Oskar', 'Tomasz', 'Paweł', 'Łukasz', 'Zbigniew', 'Sławek', 'Kamil', 'Dominik'],
  last_names: ['Kowalski', 'Kapusta', 'Nowak', 'Wójcik', 'Mazur', 'Król', 'Majewski'] 
}

def contestant_time(iteration)
  start_time = current_time+2*60*iteration
  end_time = (current_time+2*60*iteration+rand_time.to_i)
  result = end_time - start_time
  {
    start_time_at: start_time, 
    end_time_at: end_time,
    end_time: result
  }
end

def current_time
  Time.now
end

def rand_time
  rand * (MAX_RACE_TIME - MIN_RACE_TIME) + MIN_RACE_TIME
end


10.times do |iteration, time|
  time = contestant_time(iteration)
  Contestant.create(
     :first_name => CONTESTANT[:names].sample,
     :last_name => CONTESTANT[:last_names].sample,
     :start_time_at => time[:start_time_at], 
     :end_time_at => time[:end_time_at],
     :end_time => time[:end_time]
    )
end