# CFA Group Project -- Trent Tracker

##About The Project

This project is inspired by Trent's newly acquired celebrity status in the Philippines. All celebrities of note have legions of adoring groupies.

Our project aims to solve the question -- as a fan, where is Trent today?, and how can I show my devotion to him?

### Design Criteria

We used the following user stories to design our application:

** User stories **
* As a Trent Lover I want to be able to select artists and songs to make a playlist and send to Trent.
* As a Trent lover I want a song based his location so I can set the mood.
* As a Trent lover I want to know the exact street address of where he is now or where he has been.
* As a Trent Lover I want to be able to enter my location and see how far away I am from Trent.
* As a Trent Lover I want to be able to send him email through the internet.

##Installation & How To Run

Install the dependencies:

Install google-maps-services:

`gem install google_maps_service`

Install rspotify:

`gem install rspotify`

Install mail

`gem install mail`

Install terminal-table

`gem install terminal-table`

The app runs in the terminal. Run:

`ruby TrentTracker.rb`

##How to use

The first to display is the splash screen informing to the user what the app is for. Press any key to go onto the selection screen. There are 3 items to choose from 1) find out Trent's location, 2) send a mix tape to Trent based on his geographical location, 3) send a love letter to trent via the inbuilt email interface.

A splash screen presents the user (a Trent admirer) with the aptly titled - Trent Tracker - app. Once pass the splash screen the user is presented with a menu of 3 options:
* 1) Choose to know how far a user is from Trent and how long it'd take to get to him.
* 2) Choose to make a mixed tape based on Trent's location and the user's location.
* 3) Send an email of admiration to Trent.

###Ruby Gems Required

* edwardsamual / google-maps-services-ruby
* a spotify ruby gem
* a STMP ruby gem

###Known bugs

After we got the initial gems to work we did testing on a sample of addresses. We started having trouble with the google maps api. It returned nil location on requests that required overseas travel. The flight mode of travel isn't available for this gem or it isn't supplied by google. This issue crashed the program. We haven't found a solution to this and will look into the documentation for further information.

After more testing we discovered a conflict between the spotify gem and the STMP gem. They wouldn't work if both of the gems were required in the header, however, it functioned when one or both were in an if statement in the body of the program. There isn't much documentation on how to solve this problem. It is an issue that requires further investigation.
