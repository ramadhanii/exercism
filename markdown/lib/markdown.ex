defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

      iex> Markdown.parse("This is a paragraph")
      "<p>This is a paragraph</p>"

      iex> Markdown.parse("# Header!\\n* __Bold Item__\\n* _Italic Item_")
      "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown) do
    String.split(markdown, "\n")
    |> Enum.map(fn sentence -> process(sentence) end)
    |> Enum.join()
    |> patch()
  end

  defp process(sentence) do
    cond do
      String.starts_with?(sentence, "#") -> parse_header_md_level(sentence)
      String.starts_with?(sentence, "*") -> parse_list_md_level(sentence)
      true -> process_paragraph(sentence)
    end
  end

  defp parse_header_md_level(sentence) do
    [hashtag | word_list] = String.split(sentence)

    case enclose_with_header_tag(String.length(hashtag), Enum.join(word_list, " ")) do
      {:ok, header} -> header
      _ -> process_paragraph(sentence)
    end
  end

  defp enclose_with_header_tag(header_level, title) when header_level < 7, do: {:ok, "<h#{header_level}>#{title}</h#{header_level}>"}
  defp enclose_with_header_tag(_, _), do: {:nok, nil}

  defp parse_list_md_level(l) do
    String.trim_leading(l, "* ")
    |> String.split()
    |> join_words_with_tags()
    |> enclose_with_list_tag()
  end

  defp enclose_with_list_tag(sentence), do:  "<li>#{sentence}</li>"

  defp process_paragraph(sentence) do
    String.split(sentence)
    |> join_words_with_tags()
    |> enclose_with_paragraph_tag()
  end
  defp enclose_with_paragraph_tag(sentence), do: "<p>#{sentence}</p>"

  defp join_words_with_tags(word_list) do
    word_list
    |> Enum.map(fn word -> replace_md_with_tag(word) end)
    |> Enum.join(" ")
  end

  defp replace_md_with_tag(word) do
    replace_prefix_md(word)
    |> replace_suffix_md()
  end

  defp replace_prefix_md(word) do
    cond do
      word =~ ~r/^#{"__"}{1}/ -> String.replace(word, ~r/^#{"__"}{1}/, "<strong>", global: false)
      word =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(word, ~r/_/, "<em>", global: false)
      true -> word
    end
  end

  defp replace_suffix_md(word) do
    cond do
      word =~ ~r/#{"__"}{1}$/ -> String.replace(word, ~r/#{"__"}{1}$/, "</strong>")
      word =~ ~r/[^#{"_"}{1}]/ -> String.replace(word, ~r/_/, "</em>")
      true -> word
    end
  end

  defp patch(html_content) do
    String.replace(html_content, "<li>", "<ul><li>", global: false)
    |> String.reverse()
    |> String.replace(String.reverse("</li>"), String.reverse("</li></ul>"), global: false)
    |> String.reverse()
  end
end
