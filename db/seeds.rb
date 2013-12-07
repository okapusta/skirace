# coding: utf-8

require_relative '../application'

MIN_RACE_TIME = 3*60
MAX_RACE_TIME = 5*60


CONTESTANT = {
  names: ['Oskar', 'Tomasz', 'Paweł', 'Łukasz', 'Zbigniew', 'Sławek', 'Kamil', 'Dominik'],
  last_names: ['Kowalski', 'Kapusta', 'Nowak', 'Wójcik', 'Mazur', 'Król', 'Majewski'] 
}

Contest.create(name: 'Default')

10.times do |iteration, time|
  Contestant.create(
     :first_name => CONTESTANT[:names].sample,
     :last_name => CONTESTANT[:last_names].sample,
     :contest_id => 1
    )
end