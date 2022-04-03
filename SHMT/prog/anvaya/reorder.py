#!/usr/bin/env python3

import daj_io
import daj_rules
import argparse


parser = argparse.ArgumentParser(
    formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    description='''This tool linearizes Samsaadhanii's dependency parsed
    tree into target language word order.''')

parser.add_argument(
    'i', metavar='input_file',
    help='specifies input file')

parser.add_argument(
    '-o', metavar='output_file',
    help='specifies output file')

parser.add_argument(
    '-l', metavar='target_language', default='sa',
    choices=['sa', 'ml', 'te', 'hi', 'mr', 'en', 'fr', 'de'],
    help='specifies the target language')

parser.add_argument(
    '-S', metavar='input_file',
    help='specifies input file')

arguments = parser.parse_args()

prob_file = arguments.S+'/SHMT/prog/anvaya/data/rel_probs.csv'
rela_file = arguments.S+'/SHMT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt'

rela_data = daj_io.load_relations(rela_file)
prob_data = daj_io.load_probabilities(prob_file)

data = daj_io.parse_data(arguments.i, rela_data)

tree = daj_rules.create_tree(data)[0]
sorted_tree = daj_rules.sort_tree(tree, prob_data)
word_order = daj_rules.linear_order_sa(sorted_tree)
data = daj_io.add_order(data, word_order)

daj_io.write_out(data, arguments.o)
