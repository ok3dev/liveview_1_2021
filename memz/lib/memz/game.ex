defmodule Memz.Game do
  defstruct [steps_total: 4, plan: [], paragraph: "", display: ""]

  def new(steps, paragraph) do
    chunk = ceil(String.length(paragraph) / steps)
    plan = 1..String.length(paragraph)
          |> Enum.shuffle
          |> Enum.chunk_every(chunk)
    %__MODULE__{paragraph: paragraph, plan: plan}
  end
  def hider(%{paragraph: paragraph,plan: [head|tail ]=game} do

    paragraph =
      paragraph
      |> String.graphemes
      |> Enum.with_index(1)
      |> Enum.map(fn {char, index}->substitute(char, index in head)end )
      |> Enum.join()
     %__MODULE__{paragraph: paragraph, plan: tail}
  end
  defp substitute(char, true), do:  "-"
  defp substitute(char, false), do: char


end
