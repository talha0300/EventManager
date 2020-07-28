require 'csv'

def largest_hash_key(hash)
  hash.key(hash.values.max).to_i
end


contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
hash_of_hours_of_the_day={}
contents.each do |row|
  registration_date=row[:regdate]
  date=DateTime.strptime(registration_date, '%m/%d/%Y %H:%M')

  hour_of_the_day=date.hour+1
  hour_of_the_day=hour_of_the_day.to_s

  begin
    hash_of_hours_of_the_day["#{hour_of_the_day}"]=hash_of_hours_of_the_day["#{hour_of_the_day}"]+1
  rescue
    hash_of_hours_of_the_day["#{hour_of_the_day}"]=1
  end

end
busyiest_hour=largest_hash_key(hash_of_hours_of_the_day)
p "Hour #{busyiest_hour} is the busyiest hour of the day"
