<?php

require __DIR__ . '/../vendor/autoload.php';

use Matrix\Matrix;

main();

function main(): void
{
    try {
        echo "Type two matrices(A & B) to multiply them", PHP_EOL;
        printMatrix(multiplyMatrices(readMatrix(), readMatrix()));
    } catch (Error $e) {
        echo $e->getMessage(), PHP_EOL;
    }
}

function readMatrix(): Matrix
{
    echo "Type matrix A:", PHP_EOL;
    echo "Type the number of columns: ";
    $column = validate(readline());
    echo "Type the number of rows: ";
    $row =  validate(readline());

    $grid = [];
    for ($i = 1; $i <= $row; $i++) {
        $line = validateArray(array_slice(explode(" ", readline("Type line $i: ")), 0, $column));
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

function validate(string $input): int
{
    if (is_numeric($input)) {
        return intval($input);
    } else {
        throw new Error("Invalid input: type just numbers");
    }
}

function validateArray(array $arr): array
{
    $intArr = [];
    foreach ($arr as $item) {
        if (!is_numeric($item)) {
            throw new Error("Type just numbers");
        }
        array_push($intArr, intval($item)) ;
    }
    return $intArr;
}
