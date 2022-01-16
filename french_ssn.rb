require 'date'
require 'yaml'

def french_ssn_info(ssn)
  genders = {
    '1' => 'male',
    '2' => 'female'
  }
  regex = /^([12]) (\d{2}) ([01]\d) (\d{2}) \d{3} \d{3} (\d{2})$/

  match_data = ssn.match(regex)
  if match_data.nil?
    'The number is invalid'
  else
    p match_data
    gender = match_data[1]
    year_of_birth = match_data[2]
    month_of_birth = match_data[3].to_i
    department = match_data[4]
    key = match_data[5]

    departments = YAML.load_file('data/french_departments.yml')
    department = departments[department]

    gender = genders[gender]
    month_of_birth = Date::MONTHNAMES[month_of_birth]
    "a #{gender}, born in #{month_of_birth}, 19#{year_of_birth} in #{department}"
  end
end
