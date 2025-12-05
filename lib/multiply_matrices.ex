defmodule MultiplyMatrices do
  def main(_args) do
    header()
    description()
    read_matrix_a()
  end

  def header do
    IO.puts("----Multiplicando Matrizes----")
  end

  def description do
    IO.puts("Digite as Matrizes enserindo o tamanho de suas colunas e linhas")
    IO.puts("E apos, ensira os numeros de uma linha por vez")
  end

  def read_matrix_a() do
    IO.puts("Matriz A:")
    columns = read_dimensions_num("Colunas")
    rows_count = read_dimensions_num("Linhas")

    IO.puts(
      "\nAgora Digite os numeros de cada linha, separados por espaco, e de Enter (ex: \"-> 1 2 3\\n\")"
    )

    read_rows(rows_count, columns)
    |> IO.inspect()
  end

  def read_dimensions_num(dimension) do
    IO.gets("Digite o numero de #{dimension}: ")
    |> to_int()
  end

  def to_int(input) when is_binary(input) do
    case Integer.parse(input) do
      {output, _} ->
        output

      :error ->
        IO.puts("Input invalido, use apenas numeros")
        System.halt(0)
    end
  end

  def to_int(input) when is_list(input) do
    Enum.map(input, fn x -> to_int(x) end)
  end

  def read_rows(0, _), do: nil

  def read_rows(count, columns) do
    row =
      IO.gets("-> ") |> handle_row(columns)

    [row | read_rows(count - 1, columns)]
  end

  def handle_row(row, columns) do
    row
    |> String.replace("\n", "")
    |> String.split()
    |> to_int()
    |> Enum.split(columns)
    |> elem(0)
    |> validate_length(columns)
  end

  def validate_length(list, columns) do
    if length(list) != columns do
      IO.puts("O numero de itens da linha deve ser igual a: #{columns}")
      System.halt(0)
    end

    list
  end
end
