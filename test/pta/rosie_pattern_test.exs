defmodule Pta.RosiePatternTest do
  def all_unit_tests_should_pass do
    {_result_message, 0} =
      System.cmd("/usr/local/bin/rosie", [
        "test",
        "/home/onorio_developer/pta/priv/rpl/events.rpl"
      ])
  end
end
