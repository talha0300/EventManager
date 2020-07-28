require 'csv'


def get_first_digit(phone_number)
  phone_number=phone_number.split('')
  phone_number.each do |x|
    if x.count('0123456789')>0
      return x.to_i
    end
  end
end



def clean_phone_number(phone_number)
  number_of_digits_in_phone_number=phone_number.count('0123456789')

  phone_number=phone_number.to_s
  if number_of_digits_in_phone_number<10 || number_of_digits_in_phone_number>11
    return [phone_number,"Bad"]
  elsif number_of_digits_in_phone_number==10
    return [phone_number,"Good"]
  elsif get_first_digit(phone_number)==1
      phone_number=phone_number[1..11]
      return [phone_number,"Good"]
  else
      return [phone_number,"Bad"]
  end
end







contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  phone_number = row[:homephone]
  #number_of_digits_in_phone_number=phone_number.count('0123456789')
  phone_number_status= clean_phone_number(phone_number)
  p phone_number_status
  #p [phone_number,number_of_digits_in_phone_number,get_first_digit(phone_number)]
end
