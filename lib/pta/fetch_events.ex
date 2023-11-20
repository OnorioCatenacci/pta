defmodule Pta.FetchEvents do
  @moduledoc """
  This module is the module that will actually go out to the website, grab the page, hand it off to Rosie to pick out the various events and then return a list of events to the caller.
  """
  @doc """
  We want to get events for a given website
  """
  # https://www.313presents.com/venue/pine-knob-music-theatre
  def find_events(html_page, event_detail_to_get) do
    path_to_events_patterns = "/home/onorio_developer/pta/priv/rpl/events.rpl"

    command_to_be_run =
      "curl -s \"" <>
        html_page <>
        "\" | /usr/local/bin/rosie grep -o json -f " <>
        path_to_events_patterns <> " " <> event_detail_to_get

    {json_of_event, 0} =
      System.shell(command_to_be_run)

    json_of_event
  end

  def get_all_event_dates() do
    find_events("https://www.313presents.com/venue/pine-knob-music-theatre", "events.event_date")
  end
end
