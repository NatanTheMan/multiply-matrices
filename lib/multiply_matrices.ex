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

    IO.puts("\nAgora Digite os numeros de cada linha, separados por espaco (ex: \"-> 1 2 3\")")

    read_rows(rows_count, columns)
    |> IO.inspect()
  end

  def read_dimensions_num(dimension) do
    IO.gets("Digite o numero de #{dimension}: ")
    |> validate()
  end

  def validate(input) when is_binary(input) do
    case Integer.parse(input) do
      {output, _} ->
        output

      :error ->
        IO.puts("Input invalido, use apenas numeros")
        System.halt(0)
    end
  end

  def validate(input) when is_list(input) do
    Enum.map(input, fn x -> validate(x) end)
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
    |> validate()
    |> Enum.split(columns)
    |> elem(0)
  end
end
