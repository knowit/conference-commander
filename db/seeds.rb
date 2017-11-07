random = Random.new

print "Creating Users: "
users_created = []
100.times do
  users_created << User.create(
    first_name: Faker::Name::first_name,
    last_name: Faker::Name::last_name,
    email: Faker::Internet::email,
    gender: random.rand(0..2),
    role: random.rand(0..3),
  )
  print '•'
end
puts

events_created = []
print "Creating Events: "
3.times do
  city = Faker::Address.city
  start_date = Faker::Date.forward(365)
  end_date = Faker::Date.between(start_date, start_date + 4.days)

  events_created << e = Event.create(
    name: city,
    description: "Fagseminar i #{city}",
    starting_at: start_date,
    ending_at: end_date,
    is_published: random.rand(100) >= 25,
  )
  e.add_accommodations(random.rand(10) + 3, 1)
  e.add_accommodations(random.rand(15) + 3, 2)
  print '•'
end
puts

events_created.each do |e|
  puts " Event: #{e.name}: ".center(50, "=")
  # Create Hotels
  print " - Creating Hotels: "
  random.rand(1..3).times do
    Hotel.create(
      name: "#{e.name} Hotel",
      address: Faker::Address.street_address,
      country: Faker::Address.country,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      event: e,
    )
    print '•'
  end
  puts

  print " - Creating Venues and Tracks: "
  random.rand(2..5).times do
    venue = Venue.create(
      name: "Room #{random.rand(100..200)}",
      description: Faker::Lorem.paragraph(2),
      capacity: random.rand(20..200).round(-1), # Nearest 10
      event: e,
    )
    print 'V'
    random.rand(1..3).times do
      Track.create(
        name: Faker::Movie.quote,
        venue: venue,
      )
      print '•'
    end
  end
  puts

  print " - Creating Sessions: "
  random.rand(10..20).times do
    start_time = Faker::Date::between(e.starting_at, e.ending_at) + random.rand(8..18).hours
    duration = [10, 30, 90].sample
    EventSession.create(
      title: Faker::Name.title,
      description: Faker::Lorem.paragraph,
      duration: duration,
      event: e,
      submitter: User.order("RANDOM()").first,
      start_time: start_time,
      outline: Faker::Lorem.paragraph(5),
      track: Track.order("RANDOM()").first,
      state: [:proposed, :rejected, :accepted].sample,
    )
    print '•'
  end
  puts

  print " - Creating Activities: "
  random.rand(5..10).times do |i|
    Activity.create(
      event: e,
      title: "#{i} #{Faker::Movie.quote}",
      description: Faker::Lorem.paragraph,
    )
    print '•'
  end
  puts

  print " - Creating Participations: "
  users_created.sample(random.rand(50..100)).each do |user|
    Participation.create(user: user, event: e, activities: Activity.order("RANDOM()").limit(4))
    print '•'
  end
  puts
end
