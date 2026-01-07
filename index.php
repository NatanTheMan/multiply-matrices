<?php

use MultiplyMatrices\Matrix;

function main(): void
{
    printHeader();
    printMatrix(multiplyMatrices(readMatrix(), readMatrix()));
}

function printHeader(): void
{
    // TODO
}

function readMatrix(): Matrix
{
    return new Matrix();
}

function printMatrix(Matrix $matrix): void
{
    // TODO
    var_dump($matrix);
}

function multiplyMatrices(Matrix $matrixA, Matrix $matrixB): Matrix
{
    return new Matrix();
}
