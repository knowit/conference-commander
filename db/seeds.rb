random = Random.new

# Create users
puts "Creating users"
100.times do
  User.create(
    first_name: Faker::Name::first_name,
    last_name: Faker::Name::last_name,
    email: Faker::Internet::email
  )
  print 'u'
end
print "\n"

# Create events
puts "Creating events"
3.times do
  city = Faker::Address.city
  start_date = Faker::Date.forward(365)
  end_date = Faker::Date.between(start_date, start_date + 4.days)

  e = Event.create(
    name: city,
    description: "Fagseminar i #{city}",
    starting_at: start_date,
    ending_at: end_date
  )
  e.add_accommodations(random.rand(10) + 3, 1)
  e.add_accommodations(random.rand(15) + 3, 2)
  print 'e'
end
puts

Event.all.each do |e|
  # Create Hotels
  puts "Creating Hotels"
  Hotel.create(
    name: "#{e.name} Hotel",
    address: Faker::Address.street_address,
    country: Faker::Address.country,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    event: e
  )
  puts 'h'

  puts "Creating Venues and Tracks"
  3.times do
    venue = Venue.create(
      name: "Room #{(100..200).to_a.sample}",
      description: Faker::Lorem.paragraph(2),
      capacity: (20..200).to_a.sample.round(-1), # Nearest 10
      event: e
    )
    (1..3).to_a.sample.times do 
      Track.create(
        name: Faker::Movie.quote,
        venue: venue
      )
      print 't'
    end
    print 'v'
  end 
  puts

  puts "Creating Sessions"
  20.times do
    start_time = Faker::Date::between(e.starting_at, e.ending_at)
    EventSession.create(
      title: Faker::Name.title,
      description: Faker::Lorem.paragraph,
      duration: [10, 30, 90].sample,
      event: e,
      submitter: User.order("RANDOM()").first,
      start_time: start_time,
      outline: Faker::Lorem.paragraph(5),
      track: Track.order("RANDOM()").first,
    )
    print 's'
  end
  puts

  puts "Creating Activities"
  8.times do |i|
    Activity.create(
      event: e,
      title: "#{i} #{Faker::Movie.quote}",
      description: Faker::Lorem.paragraph
    )
    print 'a'
  end
  puts

  puts "Creating Participations"
  User.all.each do |user|
    Participation.create(user: user, event: e, activities: Activity.order("RANDOM()").limit(4))
    print 'p'
  end
  puts
end
