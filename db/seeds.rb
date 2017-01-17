# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'Henning', email: 'henkol@knowit.no')
u2 = User.create(name: 'Vegar uten d', email: 'vegar.uten.d.molvig@knowit.no')
u2 = User.create(name: 'Rune Melhus', email: 'rme@knowit.no')

e1 = Event.create(name: "Fredrikstad", description: "Fagseminar i Fredrikstad", starting_at: "2015-11-08 17:50:00", ending_at: "2015-11-08 17:50:00")
e2 = Event.create(name: "Lofoten", description: "Fagseminar i Lofoten", starting_at: "2016-11-08 17:50:00", ending_at: "2016-11-08 17:50:00")

Proposal.create(
  title: "Do you even Rails?",
  description: "En liten techtalk om Rail",
  duration: 10,
  event: e1,
  user: u2
)

a1 = Accommodation.create(event: e1, number_of_beds: 1)
a2 = Accommodation.create(event: e1, number_of_beds: 2)

Participation.create(user: u1, event: e1, accommodation: a1)
Participation.create(user: u2, event: e1)

ac1 = Activity.create(name: 'Ølsykkel', description: 'Vi kjører sykkel og drikker øl', starting_at: "2016-11-08 17:50:00", ending_at: "2016-11-09 17:50:00", event_id: e1)
ac2 = Activity.create(name: 'Vinsmaking', description: 'Vi smaker på vin', starting_at: "2016-11-08 18:30:00", ending_at: "2016-11-10 18:00:00", event_id: e2)

acp1 = ActivityParticipation.create(activity_id: ac1.id, user_id: u1.id)
acp2 = ActivityParticipation.create(activity_id: ac2.id, user_id: u2.id)
