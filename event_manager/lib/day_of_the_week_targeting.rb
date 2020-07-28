require 'csv'

def largest_hash_key(hash)
  hash.key(hash.values.max).to_i
end


contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
hash_of_days_of_week={}
contents.each do |row|
  registration_date=row[:regdate]
  date=DateTime.strptime(registration_date, '%m/%d/%Y %H:%M')

  day_of_the_week=date.wday
  day_of_the_week=day_of_the_week.to_s

  begin
    hash_of_days_of_week["#{day_of_the_week}"]=hash_of_days_of_week["#{day_of_the_week}"]+1
  rescue
    hash_of_days_of_week["#{day_of_the_week}"]=1

  end
  #p [registration_date,day_of_the_week]

end
busyiest_hour=largest_hash_key(hash_of_days_of_week)
p "Day #{busyiest_hour} is the busyiest Day of the week"
