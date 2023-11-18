echo "<span class=\"html-attribute-value\">m-date__year</span>\"&gt;</span> / 2024<span class=\"html-tag\">" | rosie -f events.rpl match -o jsonpp events.year

echo "<span class=\"html-attribute-value\">m-date__month</span>\"&gt;</span> May <span class=\"html-tag\">" | rosie -f events.rpl match -o jsonpp events.month

echo "<span class=\"html-attribute-value\">m-date__day</span>\"&gt;</span>02<span class=\"html-tag\">" | rosie -f events.rpl match -o jsonpp events.day

