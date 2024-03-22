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
  - Venue
  - Name
  
- Venues
  - Name
  - Location


All of these "things" will translate into database tables.  Each table will have a technical key. I want to be able to pull out events by date (so I know on a given day if there's a venue I want to avoid). 

## .iex.exs

You may notice that I have an .iex.exs file in the project.  This is intentional. It allows me to quickly connect to the database via Ecto from within iex.  Further, it makes the connection readonly so I can't accidentally modify data. The put_dynamic_repo function allows me to create a separate connection to the database which doesn't interfere with other code which I may want to run.

## Challenges
The interesting part of this will be getting the date/time information for events. As far as I know there's no simple API to be invoked for getting a list of events at local (Metro Detroit) entertainment venues.  So I will need to scrape some sites and then parse the pages that come back in order to build my database of events.  This is the first challenge to work on.

I'm using HTTPoison to grab the html of the page.  For the page listing Pine Knob music theatre (which is the one I'm most interested in getting) it appears the html is parsed by some sort of Javascript library or some sort of parser before it's served to the browser.  I say this because I see this sort of html (from HTTPoison):

```
<span class="html-tag">&lt;span <span class="html-attribute-name">class</span>="<span class="html-attribute-value">m-date__singleDate</span>"&gt;</span><span class="html-tag">&lt;span
```
By the way the ```&gt;``` and ```&lt;``` above are literally what's in the text--not a mistake. 

but when I inspect source in the web browser I see something more like this:
```
 <span class=m-date__singleDate>
   <span class=m-date__month> May </span>
```

So, I can't just do a normal parse on the value returned by HTTPoison. I use [Rosie Pattern Language](https://rosie-lang.org) to do my parsing because it supports Parsing Expression Grammars which can support recursive constructs.  RegEx's do not correctly support recursive constructs.  Besides that Rosie has some other nice features (built in unit test facility is great).


# Starting the app
I've moved the PSQL db to a docker container.  If you're starting from scratch then do the following:

1.) docker compose up -d
2.) mix ecto.reset 
3.) mix phx.server

You can skip step 2 if you've already populated the db although I don't think it will hurt anything if you do run it against an already populated db. 