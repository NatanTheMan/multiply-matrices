<?php

use Matrix\Matrix;

main();

function main(): void
{
    echo "Type two matrices(A & B) to multiply them", PHP_EOL;
    printMatrix(multiplyMatrices(readMatrix(), readMatrix()));
}

function readMatrix(): Matrix
{
    echo "Type matrix A:", PHP_EOL;
    echo "Type the number of columns: ";
    $column = readline();
    echo "Type the number of rows: ";
    $row = readline();
    $grid = [];
    for ($i = 1; $i <= $row; $i++) {
        echo "Type the $i th line", PHP_EOL;
        $line = array_slice(explode(" ", readline()), $column);
        array_push($grid, $line);
    }
    return new Matrix($grid);
}

function printMatrix(Matrix $matrix): void
{
    var_dump($matrix->toArray());
}

function multiplyMatrices(Matrix $matrixA, Matrix $matrixB): Matrix
{
    return $matrixA->multiply($matrixB);
}
