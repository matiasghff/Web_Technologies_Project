# EventHub

EventHub is a Ruby on Rails web application for discovering, organizing, and reviewing university community events.

The platform allows users to browse events, view categories and venues, inspect registrations, and read reviews. This version corresponds to Assignment 2 and focuses on database integration, models, associations, validations, seed data, and read-only views.

## Course

Web Technologies — 2026  
Universidad de los Andes

## Current Features

- Static landing page integrated into Rails.
- Global responsive Bootstrap navbar and footer.
- PostgreSQL database integration.
- EventHub domain models:
  - User
  - Category
  - Venue
  - Event
  - Registration
  - Review
- Model associations, validations, and enums.
- Read-only index and show pages for:
  - Events
  - Categories
  - Venues
  - Users
  - Registrations
  - Reviews
- Seeded database with realistic sample data covering:
  - Regular users and admin users
  - Event categories
  - Campus venues
  - Events in different lifecycle states
  - Confirmed, waitlisted, and cancelled registrations
  - Reviews for completed events

## Ruby and Rails Versions

- Ruby 4.0.1
- Rails 8.1.3
- PostgreSQL
- Bootstrap 5.3.8
- Bootstrap Icons

## Setup Instructions

Clone the repository and enter the Rails app folder:

    git clone <repository-url>
    cd event_hub

Install Ruby gems:

    bundle install

Install JavaScript dependencies:

    yarn install

Create and migrate the database:

    bin/rails db:create
    bin/rails db:migrate

Load the seed data:

    bin/rails db:seed

Run the application:

    bin/dev

Open the app in the browser:

    http://localhost:3000

## Database Setup in One Command

If the database has not been created yet, you can also run:

    bin/rails db:setup

This creates the database, runs migrations, and loads the seed data.

## Running Tests

Run the test suite with:

    bin/rails test

## Main Routes

    /                   Home landing page
    /events             Events index
    /events/:id         Event details
    /categories         Categories index
    /categories/:id     Category details
    /venues             Venues index
    /venues/:id         Venue details
    /users              Users index
    /users/:id          User details
    /registrations      Registrations index
    /registrations/:id  Registration details
    /reviews            Reviews index
    /reviews/:id        Review details

## Data Model Summary

### User

Represents a platform user.

Relationships:

- Has many organized events.
- Has many registrations.
- Has many reviews.

Roles:

- regular
- admin

### Category

Represents an event category such as Technology, Academic, Sports, Arts, or Social.

Relationships:

- Has many events.

### Venue

Represents a campus location where events can take place.

Relationships:

- Has many events.

### Event

Represents an event created by a user.

Relationships:

- Belongs to an organizer, which is a User.
- Belongs to a Category.
- Belongs to a Venue.
- Has many Registrations.
- Has many Reviews.

Statuses:

- draft
- published
- ongoing
- completed
- cancelled

### Registration

Represents a user's registration for an event.

Relationships:

- Belongs to a User.
- Belongs to an Event.

Statuses:

- confirmed
- waitlisted
- cancelled

### Review

Represents feedback left by a user after attending a completed event.

Relationships:

- Belongs to a User.
- Belongs to an Event.

Ratings are limited from 1 to 5.

## Assignment 2 Scope

This submission implements the Rails database-backed version of EventHub. The application includes the complete data model, associations, validations, enums, seeded sample data, and read-only views for browsing records and their relationships.

Authentication, authorization, full CRUD actions, event registration actions, waiting list promotion, and review forms will be implemented in later assignments.