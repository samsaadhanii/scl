#!/usr/bin/env python3

import os
import argparse

import daj_io
import daj_rules

parser = argparse.ArgumentParser(
    description='''This tool linearizes Samsaadhanii's dependency parsed
    tree into target language word order.''',
    epilog='''See README.md for detailed description on usage and options.''')

parser.add_argument(
    '-i', metavar='input_file',
    help='specifies input file', required=True)

parser.add_argument(
    '-o', metavar='output_file',
    help='specifies output file')

parser.add_argument(
    '-t', metavar='target_language', default='sa',
    choices=['sa', 'ml', 'te', 'hi', 'mr', 'en', 'fr', 'de'],
    help='specifies the target language')

# parser.add_argument(
#     '-n', metavar='number_of_possibilities', default=1,
#     help='specifies the number of possible orders to calculate')

parser.add_argument(
    '--standalone', action='store_true',
    help='specifies whether running standalone')

argument = parser.parse_args()

prob_data = daj_io.load_probabilities(
    os.path.join(os.path.split(__file__)[0], 'rel_probs.csv'))

data, is_deptree = daj_io.parse_data(argument.i)

if is_deptree:
    trees = daj_rules.create_tree(data)
    trees = daj_rules.sort_subtrees(trees)
    word_order = []
    for tree in trees:
        sorted_tree = daj_rules.sort_tree(tree, prob_data)
        this_order = daj_rules.linear_order(sorted_tree, argument.t)
        word_order.extend(this_order)
else:
    word_order = list(data)

data = daj_io.add_order(data, word_order)

daj_io.write_out(data, argument.standalone, argument.o)
