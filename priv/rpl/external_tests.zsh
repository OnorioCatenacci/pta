echo "<span class=\"html-attribute-value\">m-date__year</span>\"&gt;</span> / 2024<span class=\"html-tag\">" | rosie -f events.rpl match -o jsonpp events.year

echo "<span class=\"html-attribute-value\">m-date__month</span>\"&gt;</span> May <span class=\"html-tag\">" | rosie -f events.rpl match -o jsonpp events.month

echo "<span class=\"html-attribute-value\">m-date__day</span>\"&gt;</span>02<span class=\"html-tag\">" | rosie -f events.rpl match -o jsonpp events.day

System.shell(
        "\"" <> html_page <> "\"" <>
          " | /usr/local/bin/rosie -f " <>
          path_to_events_patterns <> " match -o json " <> event_detail_to_get
      )

System.shell("curl -s \"https://www.313presents.com/venue/pine-knob-music-theatre\" | rosie grep -o subs -f $HOME/pta/priv/rpl/events.rpl events.event_date")