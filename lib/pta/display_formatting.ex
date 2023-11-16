defmodule Pta.DisplayFormatting do
  defmacro __using__(_) do
    quote do
      def format_standard_date(date_to_be_formatted) do
        Calendar.strftime(date_to_be_formatted, "%B %-d, %Y")
      end

      def format_standard_time(time_to_be_formatted) do
        Calendar.strftime(time_to_be_formatted, "%I:%M %p")
      end
    end
  end
end
