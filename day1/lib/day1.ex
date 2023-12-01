defmodule Day1 do
  @spec read_file() :: binary()
  def read_file do
    {:ok, contents} = File.read("./input.txt")
    contents
  end

  @spec split_file() :: [binary()]
  def split_file do
    read_file() |> String.split("\n", trim: true)
  end

  @spec get_only_nums() :: list()
  def get_only_nums do
    valid_numbers = %{
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9"
    }

    keys = valid_numbers |> Map.keys()

    nums =
      Enum.map(split_file(), fn line ->
        replaced_line =
          String.replace(line, keys, fn word ->
            Map.get(valid_numbers, word)
          end)

        replaced_line = replaced_line |> String.replace(~r/[^\d]/, "")
        replaced_line
      end)

    nums
  end

  @spec get_first_last(binary()) :: binary()
  def get_first_last(num) do
    splitStr = String.split(num, "", trim: true)
    first = Enum.at(splitStr, 0)
    last = Enum.at(splitStr, -1)

    if length(splitStr) === 1 do
      first <> first
    else
      first <> last
    end
  end

  @spec get_first_and_last_item() :: list()
  def get_first_and_last_item do
    nums = get_only_nums()
    arr_of_nums = Enum.map(nums, fn num -> get_first_last(num) end)
    arr_of_nums
  end

  @spec get_sum() :: :ok
  def get_sum() do
    nums = get_first_and_last_item()

    sum =
      Enum.reduce(nums, 0, fn num, acc ->
        String.to_integer(num) + acc
      end)

    IO.puts(sum)
  end
end
