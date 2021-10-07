defmodule DateParser do
  def day() do
    # Please implement the day/0 function
    "[0]?\\d{1,2}"
  end

  def month() do
    # Please implement the month/0 function
    "[0]?\\d{1,2}"
  end

  def year() do
    # Please implement the year/0 function
    "\\d{4}"
  end

  def day_names() do
    # Please implement the day_names/0 function
    "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)"
  end

  def month_names() do
    # Please implement the month_names/0 function
    "(January|February|March|April|May|June|July|August|September|October|November|December)"
  end

  def capture_day() do
    # Please implement the capture_day/0 function
    "(?<day>#{day()})"
  end

  def capture_month() do
    # Please implement the capture_month/0 function
    "(?<month>#{month()})"
  end

  def capture_year() do
    # Please implement the capture_year/0 function
    "(?<year>#{year()})"
  end

  def capture_day_name() do
    # Please implement the capture_day_name/0 function
    "(?<day_name>#{day_names()})"
  end

  def capture_month_name() do
    # Please implement the capture_month_name/0 function
    "(?<month_name>#{month_names()})"
  end

  def capture_numeric_date() do
    # Please implement the capture_numeric_date/0 function
    "#{capture_day()}/#{capture_month()}/#{capture_year()}"
  end

  def capture_month_name_date() do
    # Please implement the capture_month_name_date/0 function
    "#{capture_month_name()} #{capture_day()}, #{capture_year()}"
  end

  def capture_day_month_name_date() do
    # Please implement the capture_day_month_name_date/0 function
    "#{capture_day_name()}, #{capture_month_name_date()}"
  end

  def match_numeric_date() do
    # Please implement the match_numeric_date/0 function
    ~r/^#{capture_numeric_date()}$/
  end

  def match_month_name_date() do
    # Please implement the match_month_name_day/0 function
    ~r/^#{capture_month_name_date()}$/
  end

  def match_day_month_name_date() do
    # Please implement the match_day_month_name_date/0 function
    ~r/^#{capture_day_month_name_date()}$/
  end
end
