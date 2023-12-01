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
    nums = Enum.map(split_file(), fn line -> line |> String.replace(~r/[^\d]/, "") end)
    # IO.puts(nums, "NUMS")
    nums
  end

  @spec get_first_last(binary()) :: String.t()
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
    test = Enum.map(nums, fn num -> get_first_last(num) end)
    test
  end

  @spec sum_first_last() :: :ok
  def sum_first_last() do
    nums = get_first_and_last_item()
    sum = Enum.reduce(nums, 0, fn num, acc -> String.to_integer(num) + acc end)
    IO.puts(sum)
  end
end
