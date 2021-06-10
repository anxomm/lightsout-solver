#!/usr/bin/python3

import sys

with open(sys.argv[1], "r") as input:
    with open(sys.argv[2], "w") as output:
        dim = int(input.readline())
        output.write(f"#const dim={dim}.\n")
        for i in range(dim):
            row = input.readline().strip()
            for j in range(dim):
                output.write(f"cell({i},{j},{'on' if int(row[j]) == 1 else 'off'}).\t")
            output.write("\n")