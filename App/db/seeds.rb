# This file seeds the EventHub database with realistic sample data.
# It covers all main entities: users, categories, venues, events, registrations, and reviews.

puts "Cleaning database..."

Review.destroy_all
Registration.destroy_all
Event.destroy_all
Venue.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating users..."

admin = User.create!(
  first_name: "Sofia",
  last_name: "Admin",
  email: "sofia.admin@uandes.cl",
  encrypted_password: "placeholder",
  role: :admin
)

matias = User.create!(
  first_name: "Matias",
  last_name: "Garcia",
  email: "matias.garcia@uandes.cl",
  encrypted_password: "placeholder",
  role: :regular
)

camila = User.create!(
  first_name: "Camila",
  last_name: "Torres",
  email: "camila.torres@uandes.cl",
  encrypted_password: "placeholder",
  role: :regular
)

benjamin = User.create!(
  first_name: "Benjamin",
  last_name: "Rojas",
  email: "benjamin.rojas@uandes.cl",
  encrypted_password: "placeholder",
  role: :regular
)

valentina = User.create!(
  first_name: "Valentina",
  last_name: "Mendez",
  email: "valentina.mendez@uandes.cl",
  encrypted_password: "placeholder",
  role: :regular
)

diego = User.create!(
  first_name: "Diego",
  last_name: "Fuentes",
  email: "diego.fuentes@uandes.cl",
  encrypted_password: "placeholder",
  role: :regular
)

puts "Creating categories..."

technology = Category.create!(
  name: "Technology",
  description: "Events about software, innovation, artificial intelligence, and digital tools."
)

academic = Category.create!(
  name: "Academic",
  description: "Talks, study sessions, and activities related to university courses and research."
)

sports = Category.create!(
  name: "Sports",
  description: "Recreational and competitive physical activities for the university community."
)

arts = Category.create!(
  name: "Arts",
  description: "Creative events related to music, design, theater, photography, and visual arts."
)

social = Category.create!(
  name: "Social",
  description: "Community gatherings, networking events, and informal campus activities."
)

puts "Creating venues..."

auditorium = Venue.create!(
  name: "Main Auditorium",
  building: "Humanities Building",
  room: "A101",
  address: "Universidad de los Andes, Santiago",
  max_capacity: 120
)

innovation_lab = Venue.create!(
  name: "Innovation Lab",
  building: "Engineering Building",
  room: "E204",
  address: "Universidad de los Andes, Santiago",
  max_capacity: 35
)

sports_center = Venue.create!(
  name: "Sports Center",
  building: "Sports Complex",
  room: "Court 1",
  address: "Universidad de los Andes, Santiago",
  max_capacity: 50
)

library_room = Venue.create!(
  name: "Library Study Room",
  building: "Central Library",
  room: "L302",
  address: "Universidad de los Andes, Santiago",
  max_capacity: 20
)

arts_room = Venue.create!(
  name: "Creative Arts Room",
  building: "Arts Building",
  room: "AR12",
  address: "Universidad de los Andes, Santiago",
  max_capacity: 25
)

puts "Creating events..."

draft_event = Event.create!(
  title: "Draft: Introduction to Rails Project Ideas",
  status: :draft,
  starts_at: 10.days.from_now.change(hour: 10, min: 0),
  ends_at: 10.days.from_now.change(hour: 12, min: 0),
  max_attendees: 20,
  organizer: matias,
  category: technology,
  venue: innovation_lab
)

published_talk = Event.create!(
  title: "AI in University Life",
  status: :published,
  starts_at: 7.days.from_now.change(hour: 15, min: 0),
  ends_at: 7.days.from_now.change(hour: 17, min: 0),
  max_attendees: 3,
  organizer: camila,
  category: technology,
  venue: auditorium
)

published_workshop = Event.create!(
  title: "Ruby on Rails Study Workshop",
  status: :published,
  starts_at: 5.days.from_now.change(hour: 11, min: 0),
  ends_at: 5.days.from_now.change(hour: 13, min: 0),
  max_attendees: 12,
  organizer: matias,
  category: academic,
  venue: library_room
)

ongoing_event = Event.create!(
  title: "Campus Football Match",
  status: :ongoing,
  starts_at: 1.hour.ago,
  ends_at: 2.hours.from_now,
  max_attendees: 30,
  organizer: benjamin,
  category: sports,
  venue: sports_center
)

completed_event = Event.create!(
  title: "Photography Basics for Beginners",
  status: :completed,
  starts_at: 10.days.ago.change(hour: 14, min: 0),
  ends_at: 10.days.ago.change(hour: 16, min: 0),
  max_attendees: 15,
  organizer: valentina,
  category: arts,
  venue: arts_room
)

cancelled_event = Event.create!(
  title: "Cancelled: Welcome Coffee Meetup",
  status: :cancelled,
  starts_at: 3.days.from_now.change(hour: 9, min: 30),
  ends_at: 3.days.from_now.change(hour: 10, min: 30),
  max_attendees: 25,
  organizer: diego,
  category: social,
  venue: auditorium
)

puts "Creating registrations..."

Registration.create!(
  user: matias,
  event: published_talk,
  status: :confirmed,
  registered_at: 2.days.ago
)

Registration.create!(
  user: benjamin,
  event: published_talk,
  status: :confirmed,
  registered_at: 2.days.ago
)

Registration.create!(
  user: valentina,
  event: published_talk,
  status: :confirmed,
  registered_at: 1.day.ago
)

Registration.create!(
  user: diego,
  event: published_talk,
  status: :waitlisted,
  registered_at: 12.hours.ago,
  waitlist_position: 1
)

Registration.create!(
  user: camila,
  event: published_workshop,
  status: :confirmed,
  registered_at: 1.day.ago
)

Registration.create!(
  user: benjamin,
  event: published_workshop,
  status: :confirmed,
  registered_at: 10.hours.ago
)

Registration.create!(
  user: valentina,
  event: published_workshop,
  status: :cancelled,
  registered_at: 2.days.ago,
  cancelled_at: 1.day.ago
)

# Historical registrations for completed events are inserted without validations.
# The model correctly blocks NEW registrations for completed events, but seed data
# needs past attendance records so reviews can be demonstrated.
[
  { user: matias, event: completed_event, status: :confirmed, registered_at: 12.days.ago },
  { user: camila, event: completed_event, status: :confirmed, registered_at: 12.days.ago },
  { user: diego, event: completed_event, status: :confirmed, registered_at: 11.days.ago }
].each do |attributes|
  registration = Registration.new(attributes)
  registration.save!(validate: false)
end

# Cancelled event registrations are stored as cancelled to show the cancelled lifecycle.
Registration.create!(
  user: matias,
  event: cancelled_event,
  status: :cancelled,
  registered_at: 4.days.ago,
  cancelled_at: 2.days.ago
)

Registration.create!(
  user: camila,
  event: cancelled_event,
  status: :cancelled,
  registered_at: 4.days.ago,
  cancelled_at: 2.days.ago
)

puts "Creating reviews..."

Review.create!(
  user: matias,
  event: completed_event,
  rating: 5,
  comment: "Great introductory workshop. The examples were clear and easy to follow."
)

Review.create!(
  user: camila,
  event: completed_event,
  rating: 4,
  comment: "Very useful session. I liked the practical photography exercises."
)

Review.create!(
  user: diego,
  event: completed_event,
  rating: 5,
  comment: "Excellent event. The organizer explained everything in a friendly way."
)

puts "Seeds completed successfully!"
puts "Users: #{User.count}"
puts "Categories: #{Category.count}"
puts "Venues: #{Venue.count}"
puts "Events: #{Event.count}"
puts "Registrations: #{Registration.count}"
puts "Reviews: #{Review.count}"