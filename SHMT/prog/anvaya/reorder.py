#!/usr/bin/env python3

import os
import argparse

import daj_io
import daj_rules

parser = argparse.ArgumentParser(
    description='''This tool linearizes Samsaadhanii's dependency parsed
    tree into target language word order.''')

parser.add_argument(
    '-s', metavar='scl_path',
    help='specifies root directory of SCL installation', required=True)

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

arguments = parser.parse_args()

rela_file = os.path.join(
    arguments.s, 'SHMT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt')
prob_file = os.path.join(arguments.s, 'SHMT/prog/anvaya/rel_probs.csv')

rela_data = daj_io.load_relations(rela_file)
prob_data = daj_io.load_probabilities(prob_file)

data, is_deptree = daj_io.parse_data(arguments.i, rela_data)

if is_deptree:
    trees = daj_rules.create_tree(data)
    word_order = []
    for tree in trees:
        sorted_tree = daj_rules.sort_tree(tree, prob_data)
        if arguments.t == 'hi':
            this_order = daj_rules.linear_order_hi(sorted_tree)
        else:
            this_order = daj_rules.linear_order_sa(sorted_tree)
        word_order.extend(this_order)
else:
    word_order = list(data.index)

data = daj_io.add_order(data, word_order)

daj_io.write_out(data, arguments.o)
