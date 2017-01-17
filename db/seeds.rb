# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Henning', email: 'henkol@knowit.no')
User.create(name: 'Vegarddd', email: 'vegard.molvig@knowit.no')

Event.create(name: "Fredrikstad", description: "Fagseminar i Fredrikstad", starting_at: "2015-11-08 17:50:00", ending_at: "2015-11-08 17:50:00")
Event.create(name: "Lofoten", description: "Fagseminar i Lofoten", starting_at: "2016-11-08 17:50:00", ending_at: "2016-11-08 17:50:00")

Proposal.create(
  title: "Do you even Rails?",
  description: "En liten techtalk om Rail",
  duration: 10,
  event_id: Event.first.id,
  user_id: User.first.id
)

Accommodation.create(
  number_of_beds: 2,
  event_id: Event.first.id
)

Participation.create(
  user_id: User.first.id,
  event_id: Event.first.id,
  accommodation_id: Accommodation.first.id,
)

Participation.create(
  user_id: User.last.id,
  event_id: Event.first.id,
  accommodation_id: Accommodation.first.id,
)
