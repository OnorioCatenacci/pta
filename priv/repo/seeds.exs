# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pta.Repo.insert!(%Pta.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Pine Knob Music Theater",
  address: "7774 Sashabaw Rd.",
  city: "Clarkston",
  state: "MI",
  zip: "48348-4750"
})

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Meadow Brook Amphitheatre",
  address: "3554 Walton Blvd.",
  city: "Rochester Hills",
  state: "MI",
  zip: "48309"
})

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Michigan Lottery Amphitheatre",
  address: "14900 Metro Pkwy.",
  city: "Sterling Heights",
  state: "MI",
  zip: "48312"
})

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Little Caesars Arena",
  address: "2645 Woodward Avenue",
  city: "Detroit",
  state: "MI",
  zip: "48201"
})

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Fox Theatre",
  address: "2211 Woodward Avenue",
  city: "Detroit",
  state: "MI",
  zip: "48201"
})

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Little Caesars Arena",
  address: "2645 Woodward Avenue",
  city: "Detroit",
  state: "MI",
  zip: "48201"
})

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Comerica Park",
  address: "2100 Woodward Avenue",
  city: "Detroit",
  state: "MI",
  zip: "48201"
})

Pta.Repo.insert!(%Pta.Event.Venue{
  name: "Ford Field",
  address: "2000 Brush Street",
  city: "Detroit",
  state: "MI",
  zip: "48226"
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Sessanta",
  date: Date.from_iso8601!("2024-05-02"),
  performer: "Primus, Puscifer, and A Perfect Circle",
  start_time: Time.from_iso8601!("20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Summer Camp With Trucks Tour",
  date: Date.from_iso8601!("2024-06-06"),
  performer: "Hootie & The Blowfish wsg Collective Soul and Edwin McCain",
  start_time: Time.from_iso8601!("19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Mule Pull '24 Tour",
  date: Date.from_iso8601!("2024-06-11"),
  performer: "Tyler Chilers wsg S. G. Goodman",
  start_time: Time.from_iso8601!("19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Magic Summer Tour",
  date: Date.from_iso8601!("2024-06-18"),
  performer: "New Kids On The Block wsg Paula Abdul and D. J. Jazzy Jeff",
  start_time: Time.from_iso8601!("19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "The Show",
  date: Date.from_iso8601!("2024-07-10"),
  performer: "Niall Horan",
  start_time: Time.from_iso8601!("19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Triple Moon Tour",
  date: Date.from_iso8601!("2024-07-16"),
  performer: "Alanis Morissette wsg Joan Jett & the Blackhearts and Morgan Wade",
  start_time: Time.from_iso8601!("19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Heart & Soul 2024 Tour",
  date: Date.from_iso8601!("2024-07-17"),
  performer: "Earth, Wind & Fire And Chicago",
  start_time: Time.from_iso8601!("19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Summer of '99 Tour",
  date: Date.from_iso8601!("2024-07-31"),
  performer: "Creed wsg 3 Doors Down and Finger Eleven",
  start_time: Time.from_iso8601!("19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "The Best of All Worlds",
  date: Date.from_iso8601!("2024-08-02"),
  performer: "Sammy Hagar wsg Loverboy",
  start_time: Time.from_iso8601!("19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "Seasons 2024 World Tour",
  date: Date.from_iso8601!("2024-08-06"),
  performer: "Thirty Seconds To Mars wsg AFI, Poppy and Kennyhoopla",
  start_time: Time.from_iso8601!("18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 1,
  name: "The Sharp Dressed Simple Man Tour",
  date: Date.from_iso8601!("2024-09-13"),
  performer: "Lynyrd Skynyrd + ZZ Top wsg The Outlaws",
  start_time: Time.from_iso8601!("18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 3,
  name: "The CAVES World Tour",
  date: Date.from_iso8601!("2024-05-29"),
  performer: "NEEDTOBREATHE wsg Judah & The Lion",
  start_time: Time.from_iso8601!("19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 3,
  name: "Burn It Down Tour 2024",
  date: Date.from_iso8601!("2024-06-08"),
  performer: "Parker McCollum wsg Corey Kent",
  start_time: Time.from_iso8601!("19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 3,
  name: "Think Later Tour",
  date: Date.from_iso8601!("2024-07-28"),
  performer: "Tate McRae wsg Presley Regier",
  start_time: Time.from_iso8601!("20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: 3,
  name: "O.A.R. Summer Tour 24",
  date: Date.from_iso8601!("2024-08-24"),
  performer: "O.A.R. wsg Fitz and The Tantrums",
  start_time: Time.from_iso8601!("18:55:00-05:00")
})
