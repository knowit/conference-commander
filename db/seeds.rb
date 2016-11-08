# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'factory_girl'
require 'as-duration'

#User.create(name: 'Henning', email: 'henkol@knowit.no')
#User.create(name: 'Vegarddd', email: 'vegard.molvig@knowit.no')

FactoryGirl.define do
  factory :user do
    name     Faker::Name.name
    email    { Faker::Internet.email }
  end
end

FactoryGirl.define do
  factory :event do
    name            Faker::Name.name
    description     Faker::Lorem.paragraphs
    starting_at     Faker::Time.between(DateTime.now + 30, DateTime.now + 31, :day)
    ending_at       Faker::Time.between(DateTime.now + 32, DateTime.now + 34, :day)
  end
end

rand(25..120).times { FactoryGirl.create(:user) }
