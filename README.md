# Web Technologies Project — EventHub

EventHub is a Ruby on Rails web application for discovering, organizing, and reviewing university community events.

This repository contains the course project deliveries for Web Technologies 2026.

## Repository Structure

    Assignment_1/
      Contains the first assignment files:
      - Static landing page
      - Custom CSS
      - User stories
      - Relational diagram

    App/
      Contains the Ruby on Rails application developed for Assignment 2.

## Assignment 1

The first assignment includes:

- A static Bootstrap landing page.
- User stories for the EventHub platform.
- A relational data model diagram.
- Initial project documentation.

Files are located in:

    Assignment_1/

## Assignment 2

The second assignment implements EventHub as a Rails application with database integration.

Main features included:

- Rails 8.1.3 application.
- PostgreSQL database.
- Bootstrap styling.
- Models:
  - User
  - Category
  - Venue
  - Event
  - Registration
  - Review
- Associations, validations, and enums.
- Seeded database with realistic sample data.
- Read-only index and show views for all main entities.
- Global navigation bar and footer.

Rails app files are located in:

    App/

## Running the Rails App

Enter the Rails app folder:

    cd App

Install dependencies:

    bundle install
    yarn install

Set up the database:

    bin/rails db:setup

Run the server:

    bin/dev

Open in the browser:

    http://localhost:3000

## Running Tests

From inside the `App/` folder:

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

## Course

Web Technologies — 2026  
Universidad de los Andes

## Status

Current submission: Assignment 2 — Rails Application with Database Integration.