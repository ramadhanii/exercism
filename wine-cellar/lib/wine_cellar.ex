defmodule WineCellar do
  def explain_colors do
    # Please implement the explain_colors/0 function
    [
      {:white, "Fermented without skin contact."},
      {:red, "Fermented with skin contact using dark-colored grapes."},
      {:rose, "Fermented with some skin contact, but not enough to qualify as a red wine."}
    ]
  end

  def filter(cellar, color, opts \\ []) do
    # Please implement the filter/3 function
    Keyword.take(cellar, [color])
    |> Keyword.get_values(color)
    |> apply_filter?(Enum.sort(opts))

    # new_cellar = if Keyword.has_key?(opts, :year), do: filter_by_year(new_cellar, Keyword.get(opts, :year))
    # if Keyword.has_key?(opts, :country), do: filter_by_country(new_cellar, Keyword.get(opts, :country))
  end

  defp apply_filter?(keywords, opts)
  defp apply_filter?(keywords, [country: country, year: year]), do: filter_by_year(filter_by_country(keywords, country), year)
  defp apply_filter?(keywords, [year: year]), do: filter_by_year(keywords, year)
  defp apply_filter?(keywords, [country: country]), do: filter_by_country(keywords, country)
  defp apply_filter?(keywords, _), do: keywords

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
