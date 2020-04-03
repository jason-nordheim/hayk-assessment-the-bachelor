def get_first_name_of_season_winner(data, season)
  # code here
  contestant = data[season].find { |contestant| contestant["status"] == "Winner"}
  return contestant["name"].split[0]
end

def get_contestant_name(data, occupation)
  name = nil 
  people = get_all_contestants(data)
  # person.values[0] == name 
  # person.values[3] == occupation
  people.each { |person| name = person.values[0] if person.values[3] == occupation }
  name 
end

def count_contestants_by_hometown(data, hometown)
  # code here
  all_people = get_all_contestants(data) 
  selected_people = all_people.select { |x| x["hometown"] == hometown }
  selected_people.length 
end

def get_occupation(data, hometown)
  # code here
  first_match = get_all_contestants(data).find {|x| x["hometown"] == hometown}
  first_match["occupation"]
end

def get_average_age_for_season(data, season)
  # code here
  ppl_in_season = data[season]
  ppl_ages = ppl_in_season.map {|person| person["age"].to_f }
  sum_of_ages = ppl_ages.reduce(0) {|memo, age| memo += age }
  avg_age = (sum_of_ages / ppl_in_season.length).round
end


# Helper Function - Returns contestants from all seasons 
def get_all_contestants data 
  people = []
  data.each { | season | contestants = season[1]; 
    contestants.each { | person | people << person } }
  people 
end 

