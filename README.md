# Pta

Places To Avoid

This is just a small, simple app to allow me to keep track of upcoming concerts, plays, sporting events etc. so I can avoid the gnarly traffic associated with them.  

# My thought process

Since I am partially building this to demonstrate my skills as a developer, I'm going to document my reasoning for construction/design decisions.  I'll put that documentation here. 

## Data
I consider there will be a few things I need to keep track of:

- Events
  - Date
  - Time Of Start
  - Estimated Event Duration in minutes
  - Venue
  - Name
  
- Venues
  - Name
  - Location
  - Roads associated to avoid

- EventType
- VenueType

All of these "things" will translate into database tables.  Each table will have a technical key. I want to be able to pull out events by date (so I know on a given day if there's a venue I want to avoid). 

## Challenges
The interesting part of this will be getting the date/time information for events. As far as I know there's no simple API to be invoked for getting a list of events at local (Metro Detroit) entertainment venues.  So I will need to scrape some sites and then parse the pages that come back in order to build my database of events.  This is the first challenge to work on.