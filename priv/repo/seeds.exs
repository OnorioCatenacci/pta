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
