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
    read_dimensions_num("Colunas")
    rows = read_dimensions_num("Linhas")

    read_row(rows)
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

  def read_row(0), do: nil

  def read_row(count) do
    row =
      IO.gets("-> ")
      |> String.replace("\n", "")
      |> String.split()
      |> validate()

    [row | read_row(count - 1)]
  end
end
