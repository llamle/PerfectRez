# PerfectRez
Final Project GA

## Overview of `PerfectRez`

This is my final project at General Assembly. The goal of this project is to make it easier for individuals to track, store and retrieve work accomplishments.

The idea for this came about after a meeting with our outcomes coach. One of the pain points is that a majority of people do not keep track of their accomplishments at work, and often have a hard time showcasing their best work for performance reviews or for a new job search.

This tool aims to make that process easier by allowing users to upload information easily via form post, email to the site, or text messages to the site. They can also retrieve the information back via a simple search.

## Project Details

### Main Features

The product was built using Ruby on Rails.
The database used is PostgreSQL.

### APIs Used

Twilio for sending and receiving SMS messages.
Sendgrid for sending and receiving email messages.  (feature currently offline pending resolution to account fraud)

### Ruby Gems Used

Public:
'bcrypt' for password encryption.

'annotate' for annotating Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.

'materialize-sass' for styling the SASS and CSS.

'font-awesome-sass' for scalable social media icons.

'modernizer-rails' for detecting HTML5 and CSS3 features in the user’s browser.

'angularjs-rails' to incorporate angular for use in search.

'figaro' to safely store API keys and login credentials in an ENV file.

'griddler-sendgrid' to receive emails in my app.

'twilio-ruby' to send and receive sms messages with my app.

Development:
'dotenv-rails' for loading .env files into ENV in development
'rails-footnotes' for displaying footnotes in the application for easy debugging, such as sessions, request parameters, cookies, filter chain, routes, queries, etc.

## Time frame

### This application was built over the course of 5 days.

The first day was planning the database and wireframing.
The second day was setting up the database and getting the Rails Models, Views, and Controllers to play nice with one another.
The third and fourth day was getting the site built and functional and doing styling.
The fifth day was adding Sendgrid and Twilio APIs and getting them to work.
