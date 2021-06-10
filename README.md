# LightsOut solver

## Introduction

The logic game [LightsOut](https://en.wikipedia.org/wiki/Lights_Out_(game)) can
be easily modeled with a declarative programming language like Clingo. So the aim
of this project is to solve any grid NxN of this game.

## Encoder

First of all, we need to encode the table with the _encoder.py_. The input must
include the dimension of the grid and the initial state of the cells (on=1, off=0).
Some examples are given in the _test_ folder.

To execute the encoder just run the following command:

```
python3 src/encoder.py <input.txt> <output.lp>
```

## Solver

After encoding our table just run the command:

```
telingo src/lightsout.lp <output.lp>
```

This solver generates concurrent actions which consist in toggling specific
cells. Then the program checks how many adjacent cells have been toggled
for each cell (including itself) and if the result is odd then its state 
changes. The problem is solved when no cell is turned on.
