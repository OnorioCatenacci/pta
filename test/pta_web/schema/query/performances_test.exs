defmodule PtaWeb.Schema.Query.PerformanceTest do
  use PtaWeb.ConnCase, async: true

  #  setup do
  #    PtaWeb.Seeds.run()
  #  end

  @query """
  {
    performances {
      id
      name
      date
      performer
      startTime
    }
  }
  """

  test "Performances returns performances" do
    conn = build_conn()
    conn = get conn, "/api", query: @query
    assert json_response(conn, 200) == %{"data" => %{"performances" => [_]}}
  end
end
