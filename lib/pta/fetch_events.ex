defmodule Pta.FetchEvents do
  @moduledoc """
  This module is the module that will actually go out to the website, grab the page, hand it off to Rosie to pick out the various events and then return a list of events to the caller.
  """
  @doc """
  We want to get events for a given website
  """
  # https://www.313presents.com/venue/pine-knob-music-theatre
  def get_events(website) do
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!(website)

    body
  end

  def find_events(html_page) do
    System.cmd("rosie")
  end
end
