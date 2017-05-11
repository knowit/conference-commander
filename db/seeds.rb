# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: 'Henning', last_name: 'Koller', email: 'henkol@knowit.no')
u2 = User.create(first_name: 'Vegar uten d', last_name: 'Molvig', email: 'vegar.uten.d.molvig@knowit.no')

e1 = Event.create(name: "Fredrikstad", description: "Fagseminar i Fredrikstad", starting_at: "2015-11-08 17:50:00", ending_at: "2015-11-08 17:50:00")
e2 = Event.create(name: "Lofoten", description: "Fagseminar i Lofoten", starting_at: "2016-11-08 17:50:00", ending_at: "2016-11-08 17:50:00")

e1.add_accommodations(10, 1)
e1.add_accommodations(15, 2)
e2.add_accommodations(5, 1)
e2.add_accommodations(20, 2)

Hotel.create(name: "Havna Hotel", event: e1)
Hotel.create(name: "Lofoten Hotel", event: e2)

Proposal.create(
  title: "Do you even Rails?",
  description: "En liten techtalk om Rail",
  duration: 10,
  event: e1,
  user: u2
)

Participation.create(user: u1, event: e1, accommodation: e1.accommodations.first)
Participation.create(user: u2, event: e1)
