#!/usr/bin/env python3

import os
import csv
import numpy
import pandas
import devtrans


def load_relations(rela_file):
    '''Load Relation Names -> Relation ID data
    from Samsaadhanii's "relations.txt" file'''

    rela_dict = {}

    with open(rela_file) as rfile:
        reader = csv.reader(rfile, delimiter=' ')
        for row in reader:
            rela_dict[row[0]] = int(row[1])

    return rela_dict


def load_probabilities(prob_file):
    '''Load file with relation couplet probabilities'''

    prob_data_dict = {}

    prob_data = pandas.read_csv(prob_file, usecols=(0, 1, 4, 6))
    for _, fields in prob_data.iterrows():
        prob_data_dict[(int(fields.x), int(fields.y))] = fields.pxy
        prob_data_dict[(int(fields.y), int(fields.x))] = fields.pyx

    return prob_data_dict


def parse_data(fname, rela_data):
    '''Parses input spreadsheet file with dependency graph
    into a Pandas dataframe'''

    fexte = os.path.splitext(fname)[1].strip('.')

    if fexte in ('csv', 'tsv'):
        data = pandas.read_csv(fname, sep='\t')
    elif fexte in ('xls', 'xlsx', 'ods'):
        data = pandas.read_excel(fname)

    data['kaaraka_sambandha'].replace(numpy.nan, '', inplace=True)

    # Splits Relation field to Relation ID and Parent ID
    for ind, fields in data.iterrows():
        burst = parse_relation_field(fields['kaaraka_sambandha'], rela_data)
        data.at[ind, 'r_id'] = burst[0]
        data.at[ind, 'p_id'] = burst[1]
        data.at[ind, 'niwya_p_id'] = burst[2]

    # Word ID, Relation ID and Parent ID are indeed integers
    data = data.astype({
        'index': int, 'r_id': int, 'p_id': int, 'niwya_p_id': int})

    # I don't need Pandas' indices, I have an index -- Word ID
    data.set_index('index', inplace=True)

    is_deptree = True if any(data.r_id) else False

    return data, is_deptree


def parse_relation_field(text, rela_data):
    '''Splits the text in kaaraka_sambandha field into Relation Name
    and Parent ID. Relation Name is further mapped to the Relation ID'''

    #text = devtrans.dev2wx(text)

    if text.startswith('aBihiwa') or not text.strip('-'):
        return 0, 0, 0

    relation_id = parent_id = niwya_parent_id = 0

    rels = text.split(';')
    for rel in rels:
        rel_name, p_id = rel.split(',')
        if not rel_name:
            continue
        elif rel_name.startswith('niwya'):
            niwya_parent_id = int(p_id)
        else:
            relation_id = int(rela_data[rel_name])
            parent_id = int(p_id)

    return relation_id, parent_id, niwya_parent_id


def add_order(data, word_order):
    '''Add reordered word IDs in the poem column of Pandas dataframe
    and remove temporary columns (r_id, p_id).'''

    for index in data.index:
        poem = word_order.index(index) + 1
        data.at[index, 'poem'] = poem

    data.drop(['r_id', 'p_id', 'niwya_p_id'], axis=1, inplace=True)
    data = data.astype({'poem': int})
    data.replace(numpy.nan, '', inplace=True)

    return data


def write_out(data, out_file):
    '''Write dataframe marked with prose word order to output file.
    If output file is not specified print the words in the order to STDOUT'''

    if out_file:
        fexte = os.path.splitext(out_file)[1]
        if fexte == '.xlsx':
            data.to_excel(out_file)
        else:
            data.to_csv(out_file, sep='\t')
    else:
        print(data.sort_values('poem')['word']
              .apply(lambda x: devtrans.dev2wx(x)))
