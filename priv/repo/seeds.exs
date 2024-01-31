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

# While it may seem odd to add a module in here it allows me to
# use the id's of the various venues without having to assume any particular
# id in advance.  As it stands right now, id 1 is Pine Knob Music Theater and id 3 is
# Michigan Lottery Amphitheatre (formerly Freedom Hill Amphitheatre).  With this little
# bit of extra code I don't have to worry if I later on need to reorder the venues
# above or if I have to insert new ones.  The script will continue to work correctly because
# it will continue to look up the correct id for the venue.

import Ecto.Query

defmodule Lookup do
  def get_id_for_venue_name(venue_name) do
    from(v in Pta.Event.Venue,
      where: v.name == ^venue_name,
      select: v.id
    )
    |> Pta.Repo.one()
  end
end

import Pta.Event.Performance, only: [calculate_event_hash: 3]

pk_id = Lookup.get_id_for_venue_name("Pine Knob Music Theater")
# AKA Freedom Hill Amphitheatre
fh_id = Lookup.get_id_for_venue_name("Michigan Lottery Amphitheatre")
lca_id = Lookup.get_id_for_venue_name("Little Caesars Arena")
fox_id = Lookup.get_id_for_venue_name("Fox Theatre")
cpk_id = Lookup.get_id_for_venue_name("Comerica Park")

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "Duel in the D",
  date: Date.from_iso8601!("2024-02-10"),
  performer: "MSU v. U of M",
  start_time: Time.from_iso8601!("20:30:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-02-10", "20:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "Bill Burr Live",
  date: Date.from_iso8601!("2024-03-10"),
  performer: "Bill Burr",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-03-10", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "The Love Hard Tour",
  date: Date.from_iso8601!("2024-03-03"),
  performer: "Keyshia Cole, Trey Songz, Jaheim and K. Michelle",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-03-03", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "Back to the Honky Tonk Tour",
  date: Date.from_iso8601!("2024-02-23"),
  performer: "Blake Shelton",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-02-23", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "2024 NCAA Division I Men's Basketball Tournament Regionals",
  date: Date.from_iso8601!("2024-03-29"),
  performer: "TBD",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-03-29", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "2024 NCAA Division I Men's Basketball Tournament Regionals",
  date: Date.from_iso8601!("2024-03-31"),
  performer: "TBD",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-03-31", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "On Your Feet!",
  date: Date.from_iso8601!("2024-02-23"),
  performer: "On Your Feet (Touring)",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-02-23", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "On Your Feet!",
  date: Date.from_iso8601!("2024-02-24"),
  performer: "On Your Feet (Touring)",
  start_time: Time.from_iso8601!("14:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-02-24", "14:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "On Your Feet!",
  date: Date.from_iso8601!("2024-02-24"),
  performer: "On Your Feet (Touring)",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-02-24", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "The Great Pirate Adventure",
  date: Date.from_iso8601!("2024-03-02"),
  performer: "Paw Patrol Live!",
  start_time: Time.from_iso8601!("10:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-02", "10:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "The Great Pirate Adventure",
  date: Date.from_iso8601!("2024-03-02"),
  performer: "Paw Patrol Live!",
  start_time: Time.from_iso8601!("14:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-02", "14:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "The Great Pirate Adventure",
  date: Date.from_iso8601!("2024-03-02"),
  performer: "Paw Patrol Live!",
  start_time: Time.from_iso8601!("18:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-02", "18:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "The Great Pirate Adventure",
  date: Date.from_iso8601!("2024-03-03"),
  performer: "Paw Patrol Live!",
  start_time: Time.from_iso8601!("10:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-03", "10:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "The Great Pirate Adventure",
  date: Date.from_iso8601!("2024-03-03"),
  performer: "Paw Patrol Live!",
  start_time: Time.from_iso8601!("14:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-03", "14:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Fan Love Tour",
  date: Date.from_iso8601!("2024-03-10"),
  performer:
    "Kayla Nicole, That Girl LAY LAY, Young Dylan, WanMor, Papa Jay, Breez Kennedy, D Sturdy, Citi Limitz, Rocco Lupo wsg King Harris",
  start_time: Time.from_iso8601!("18:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-10", "18:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Still Not Canceled",
  date: Date.from_iso8601!("2024-04-12"),
  performer: "Jeff Dunham",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-04-12", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Still Not Canceled",
  date: Date.from_iso8601!("2024-04-13"),
  performer: "Jeff Dunham",
  start_time: Time.from_iso8601!("15:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-04-13", "15:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "We Who Wrestle With God Tour",
  date: Date.from_iso8601!("2024-03-11"),
  performer: "Dr. Jordan B Peterson",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-11", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "TakeOver 5",
  date: Date.from_iso8601!("2024-03-16"),
  performer: "Gucci Mane, Rick Ross, Plies, Juvenile and Trina",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-16", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "The Goodness Tour",
  date: Date.from_iso8601!("2024-03-21"),
  performer: "Cece Winans",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-21", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "The Second Best Night of Your Life",
  date: Date.from_iso8601!("2024-03-22"),
  performer: "Brett Goldstein",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-22", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Pink Friday 2 World Tour",
  date: Date.from_iso8601!("2024-04-20"),
  performer: "Nicki Minaj",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-04-20", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Annie",
  date: Date.from_iso8601!("2024-05-03"),
  performer: "Annie (Touring)",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-05-03", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Annie",
  date: Date.from_iso8601!("2024-05-04"),
  performer: "Annie (Touring)",
  start_time: Time.from_iso8601!("14:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-05-04", "14:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Annie",
  date: Date.from_iso8601!("2024-05-04"),
  performer: "Annie (Touring)",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-05-04", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Annie",
  date: Date.from_iso8601!("2024-05-05"),
  performer: "Annie (Touring)",
  start_time: Time.from_iso8601!("13:00:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-05-05", "13:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Annie",
  date: Date.from_iso8601!("2024-05-05"),
  performer: "Annie (Touring)",
  start_time: Time.from_iso8601!("18:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-05-05", "18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: cpk_id,
  name: "Def Leppard/Journey",
  date: Date.from_iso8601!("2024-07-18"),
  performer: "Def Leppard, Journey wsg Steve Miller Band",
  start_time: Time.from_iso8601!("18:00:00-05:00"),
  event_hash: calculate_event_hash(cpk_id, "2024-07-18", "18:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: cpk_id,
  name: "The Saviors Tour",
  date: Date.from_iso8601!("2024-09-04"),
  performer: "Green Day wsg The Smashing Pumpkins, Rancid and The Linda Lindas",
  start_time: Time.from_iso8601!("17:30:00-05:00"),
  event_hash: calculate_event_hash(cpk_id, "2024-09-04", "17:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Sessanta",
  date: Date.from_iso8601!("2024-05-02"),
  performer: "Primus, Puscifer, and A Perfect Circle",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-05-02", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Renegades & Juke Box Heroes Tour",
  date: Date.from_iso8601!("2024-06-15"),
  performer: "Styx, Foreigner wsg John Waite",
  start_time: Time.from_iso8601!("18:45:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-06-15", "18:45:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "45 Years of Family Tradition",
  date: Date.from_iso8601!("2024-06-22"),
  performer: "Hank Williams, Jr. wsg Marty Stuart & His Fabulous Superlatives",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-06-22", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Loserville Tour",
  date: Date.from_iso8601!("2024-07-23"),
  performer: "Limp Bizkit wsg Bones, N8NOFACE, Corey Feldman",
  start_time: Time.from_iso8601!("18:30:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-23", "18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Summer Camp With Trucks Tour",
  date: Date.from_iso8601!("2024-06-06"),
  performer: "Hootie & The Blowfish wsg Collective Soul and Edwin McCain",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-06-06", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Mule Pull '24 Tour",
  date: Date.from_iso8601!("2024-06-11"),
  performer: "Tyler Chilers wsg S. G. Goodman",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-06-11", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Magic Summer Tour",
  date: Date.from_iso8601!("2024-06-18"),
  performer: "New Kids On The Block wsg Paula Abdul and D. J. Jazzy Jeff",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-06-18", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "The Show",
  date: Date.from_iso8601!("2024-07-10"),
  performer: "Niall Horan",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-10", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Triple Moon Tour",
  date: Date.from_iso8601!("2024-07-16"),
  performer: "Alanis Morissette wsg Joan Jett & the Blackhearts and Morgan Wade",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-16", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Heart & Soul 2024 Tour",
  date: Date.from_iso8601!("2024-07-17"),
  performer: "Earth, Wind & Fire And Chicago",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-17", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Summer of '99 Tour",
  date: Date.from_iso8601!("2024-07-31"),
  performer: "Creed wsg 3 Doors Down and Finger Eleven",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-31", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "The Best of All Worlds",
  date: Date.from_iso8601!("2024-08-02"),
  performer: "Sammy Hagar wsg Loverboy",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-08-02", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Seasons 2024 World Tour",
  date: Date.from_iso8601!("2024-08-06"),
  performer: "Thirty Seconds To Mars wsg AFI, Poppy and Kennyhoopla",
  start_time: Time.from_iso8601!("18:30:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-08-06", "18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "The Sharp Dressed Simple Man Tour",
  date: Date.from_iso8601!("2024-09-13"),
  performer: "Lynyrd Skynyrd + ZZ Top wsg The Outlaws",
  start_time: Time.from_iso8601!("18:30:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-09-13", "18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "The CAVES World Tour",
  date: Date.from_iso8601!("2024-05-29"),
  performer: "NEEDTOBREATHE wsg Judah & The Lion",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-05-29", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "Burn It Down Tour 2024",
  date: Date.from_iso8601!("2024-06-08"),
  performer: "Parker McCollum wsg Corey Kent",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-06-08", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "Think Later Tour",
  date: Date.from_iso8601!("2024-07-28"),
  performer: "Tate McRae wsg Presley Regier",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-07-28", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "O.A.R. Summer Tour 24",
  date: Date.from_iso8601!("2024-08-24"),
  performer: "O.A.R. wsg Fitz and The Tantrums",
  start_time: Time.from_iso8601!("18:55:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-08-24", "18:55:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "Fumbling Toward Ecstasy Tour",
  date: Date.from_iso8601!("2024-06-13"),
  performer: "Sarah McLachlan wsg FEIST",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-06-13", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "Billy Currington with Larry Fleet Live In Concert",
  date: Date.from_iso8601!("2024-06-14"),
  performer: "Billy Currington",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-06-14", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "Pixies and Modest Mouse 2024 North America Tour",
  date: Date.from_iso8601!("2024-06-18"),
  performer: "Pixies, Modest Mouse wsg Cat Power",
  start_time: Time.from_iso8601!("18:30:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-06-18", "18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "Summer Tour 2024",
  date: Date.from_iso8601!("2024-07-12"),
  performer: "Mother Mother, Cavetown wsg Detroy Boys",
  start_time: Time.from_iso8601!("18:30:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-07-12", "18:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Kidz Bop Live 2024",
  date: Date.from_iso8601!("2024-07-06"),
  performer: "Kidz Bop",
  start_time: Time.from_iso8601!("18:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-06", "18:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "The Doobie Brothers The 2024 Tour",
  date: Date.from_iso8601!("2024-08-15"),
  performer: "The Doobie Brothers wsg Steve Winwood",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-08-15", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Avril Lavigne Greatest Hits Tour",
  date: Date.from_iso8601!("2024-09-07"),
  performer: "Avril Lavigne wsg Simple Plan and girlfriends",
  start_time: Time.from_iso8601!("19:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-09-07", "19:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "Pink Live 2024",
  date: Date.from_iso8601!("2024-10-14"),
  performer: "Pink wsg The Script and KidCutUp",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-10-14", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fox_id,
  name: "Ali Wong Live",
  date: Date.from_iso8601!("2024-03-26"),
  performer: "Ali Wong",
  start_time: Time.from_iso8601!("19:30:00-05:00"),
  event_hash: calculate_event_hash(fox_id, "2024-03-26", "19:30:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Janet Jackson Together Again Summer 2024",
  date: Date.from_iso8601!("2024-07-02"),
  performer: "Janet Jackson wsg Nelly",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-02", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: fh_id,
  name: "Bush Loaded The Greatest Hits Tour",
  date: Date.from_iso8601!("2024-07-16"),
  performer: "Bush wsg Jerry Cantrell and Candlebox",
  start_time: Time.from_iso8601!("18:00:00-05:00"),
  event_hash: calculate_event_hash(fh_id, "2024-07-16", "18:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: lca_id,
  name: "Royal Flush Tour",
  date: Date.from_iso8601!("2024-05-21"),
  performer: "Heart wsg Cheap Trick",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(lca_id, "2024-05-21", "20:00:00-05:00")
})


Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Better Off Alone Tour",
  date: Date.from_iso8601!("2024-06-14"),
  performer: "A Boogie Wit Da Hoodie wsg NLE Choppa, Luh Tyler, Dess Dior and Byron Messia",
  start_time: Time.from_iso8601!("20:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-06-14", "20:00:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Summer Road Trip 2024",
  date: Date.from_iso8601!("2024-07-21"),
  performer: "Train and REO Speedwagon",
  start_time: Time.from_iso8601!("18:25:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-07-21", "18:25:00-05:00")
})

Pta.Repo.insert!(%Pta.Event.Performance{
  venue_id: pk_id,
  name: "Freaks On Parade",
  date: Date.from_iso8601!("2024-08-30"),
  performer: "Rob Zombie and Alice Cooper wsg Ministry and Filter",
  start_time: Time.from_iso8601!("18:00:00-05:00"),
  event_hash: calculate_event_hash(pk_id, "2024-08-30", "18:00:00-05:00")
})
