defmodule PtaWeb.Schema.Query.PerformanceTest do
  use PtaWeb.ConnCase, async: true

  #  setup do
  #    PtaWeb.Seeds.run()
  #  end

  @query """
  {
    performances(performanceDate: "2024-03-03") {
      id
      name
      date
      performer
      startTime
      venue
    }
  }
  """

  test "Performances returns performances" do
    conn = build_conn()
    conn = get conn, "/api", query: @query

    assert json_response(conn, 200) == %{
             "data" => %{
               "performances" => [
                 %{
                   "date" => "2024-03-03",
                   "id" => "14",
                   "name" => "The Great Pirate Adventure",
                   "performer" => "Paw Patrol Live!",
                   "startTime" => "14:00:00",
                   "venue" => "Fox Theatre"
                 },
                 %{
                   "date" => "2024-03-03",
                   "id" => "13",
                   "name" => "The Great Pirate Adventure",
                   "performer" => "Paw Patrol Live!",
                   "startTime" => "10:00:00",
                   "venue" => "Fox Theatre"
                 },
                 %{
                   "date" => "2024-03-03",
                   "id" => "3",
                   "name" => "The Love Hard Tour",
                   "performer" => "Keyshia Cole, Trey Songz, Jaheim and K. Michelle",
                   "startTime" => "19:00:00",
                   "venue" => "Little Caesars Arena"
                 }
               ]
             }
           }
  end
end
