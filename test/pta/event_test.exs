defmodule Pta.EventTest do
  use Pta.DataCase

  alias Pta.Event

  describe "venues" do
    alias Pta.Event.Venue

    import Pta.EventFixtures

    @invalid_attrs %{name: nil, state: nil, zip: nil, address: nil, city: nil}

    test "list_venues/0 returns all venues" do
      venue = venue_fixture()
      assert Event.list_venues() == [venue]
    end

    test "get_venue!/1 returns the venue with given id" do
      venue = venue_fixture()
      assert Event.get_venue!(venue.id) == venue
    end

    test "create_venue/1 with valid data creates a venue" do
      valid_attrs = %{name: "some name", state: "some state", zip: "some zip", address: "some address", city: "some city"}

      assert {:ok, %Venue{} = venue} = Event.create_venue(valid_attrs)
      assert venue.name == "some name"
      assert venue.state == "some state"
      assert venue.zip == "some zip"
      assert venue.address == "some address"
      assert venue.city == "some city"
    end

    test "create_venue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Event.create_venue(@invalid_attrs)
    end

    test "update_venue/2 with valid data updates the venue" do
      venue = venue_fixture()
      update_attrs = %{name: "some updated name", state: "some updated state", zip: "some updated zip", address: "some updated address", city: "some updated city"}

      assert {:ok, %Venue{} = venue} = Event.update_venue(venue, update_attrs)
      assert venue.name == "some updated name"
      assert venue.state == "some updated state"
      assert venue.zip == "some updated zip"
      assert venue.address == "some updated address"
      assert venue.city == "some updated city"
    end

    test "update_venue/2 with invalid data returns error changeset" do
      venue = venue_fixture()
      assert {:error, %Ecto.Changeset{}} = Event.update_venue(venue, @invalid_attrs)
      assert venue == Event.get_venue!(venue.id)
    end

    test "delete_venue/1 deletes the venue" do
      venue = venue_fixture()
      assert {:ok, %Venue{}} = Event.delete_venue(venue)
      assert_raise Ecto.NoResultsError, fn -> Event.get_venue!(venue.id) end
    end

    test "change_venue/1 returns a venue changeset" do
      venue = venue_fixture()
      assert %Ecto.Changeset{} = Event.change_venue(venue)
    end
  end

  describe "performances" do
    alias Pta.Event.Performance

    import Pta.EventFixtures

    @invalid_attrs %{name: nil, date: nil, performer: nil, start_time: nil, event_hash: nil}

    test "list_performances/0 returns all performances" do
      performance = performance_fixture()
      assert Event.list_performances() == [performance]
    end

    test "get_performance!/1 returns the performance with given id" do
      performance = performance_fixture()
      assert Event.get_performance!(performance.id) == performance
    end

    test "create_performance/1 with valid data creates a performance" do
      valid_attrs = %{name: "some name", date: ~D[2023-11-08], performer: "some performer", start_time: ~T[14:00:00], event_hash: "some event_hash"}

      assert {:ok, %Performance{} = performance} = Event.create_performance(valid_attrs)
      assert performance.name == "some name"
      assert performance.date == ~D[2023-11-08]
      assert performance.performer == "some performer"
      assert performance.start_time == ~T[14:00:00]
      assert performance.event_hash == "some event_hash"
    end

    test "create_performance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Event.create_performance(@invalid_attrs)
    end

    test "update_performance/2 with valid data updates the performance" do
      performance = performance_fixture()
      update_attrs = %{name: "some updated name", date: ~D[2023-11-09], performer: "some updated performer", start_time: ~T[15:01:01], event_hash: "some updated event_hash"}

      assert {:ok, %Performance{} = performance} = Event.update_performance(performance, update_attrs)
      assert performance.name == "some updated name"
      assert performance.date == ~D[2023-11-09]
      assert performance.performer == "some updated performer"
      assert performance.start_time == ~T[15:01:01]
      assert performance.event_hash == "some updated event_hash"
    end

    test "update_performance/2 with invalid data returns error changeset" do
      performance = performance_fixture()
      assert {:error, %Ecto.Changeset{}} = Event.update_performance(performance, @invalid_attrs)
      assert performance == Event.get_performance!(performance.id)
    end

    test "delete_performance/1 deletes the performance" do
      performance = performance_fixture()
      assert {:ok, %Performance{}} = Event.delete_performance(performance)
      assert_raise Ecto.NoResultsError, fn -> Event.get_performance!(performance.id) end
    end

    test "change_performance/1 returns a performance changeset" do
      performance = performance_fixture()
      assert %Ecto.Changeset{} = Event.change_performance(performance)
    end
  end
end
