random = Random.new

# Create users
puts "Creating users"
100.times do
  User.create(
    first_name: Faker::Name::first_name,
    last_name: Faker::Name::last_name,
    email: Faker::Internet::email
  )
  print '.'
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
  print '.'
end
print "\n"

puts "Creating Hotels, EventSession, Activities, and Participation"
Event.all.each do |e|
  # Create Hotels
  Hotel.create(
    name: "#{e.name} Hotel",
    address: Faker::Address.street_address,
    country: Faker::Address.country,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    event: e
  )
  print '.'

  5.times do |i|
    Track.create(
      name: "Track #{i}",
      event: e
    )
  end

  # Create EventSessions
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
      track: Track.where(event: e).order("RANDOM()").first
    )
    print '.'
  end

  8.times do |i|
    Activity.create(
      event: e,
      title: "#{i} #{Faker::Movie.quote}",
      description: Faker::Lorem.paragraph
    )
  end

  User.all.each do |user|
    Participation.create(user: user, event: e, activities: Activity.order("RANDOM()").limit(4))
    print '.'
  end
  print "\n"
end
