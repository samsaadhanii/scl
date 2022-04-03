#!/usr/bin/env python3

import sys
import csv
from decimal import Decimal
from itertools import permutations, combinations
from devtrans import dev2wx


def load_relations():
    ''''''
    relations_data = {}
    karakas = []
    to_skip = []

    with open('relations.csv') as rfile:
        reader = csv.DictReader(rfile)
        for row in reader:
            if row['relation_name'].startswith('#'):
                continue
            rel_id = int(row['relation_id'])
            relations_data[row['relation_name']] = rel_id
            if row['karaka']:
                karakas.append(rel_id)
            if row['misc'] == 's':
                to_skip.append(rel_id)

    return relations_data, karakas, to_skip


def load_data(relations_data):
    ''''''
    words = []
    with open(sys.argv[1]) as ifile:
        reader = csv.DictReader(ifile, delimiter='\t')
        for row in reader:
            relation_id, parent_id = \
                parse_relation_field(
                    row['kaaraka_sambandha'],
                    relations_data)
            words.append([
                int(row['index']),
                dev2wx(row['word']),
                relation_id,
                parent_id])
    return words


def load_probability_scores():
    ''''''
    probability_data = {}
    with open('rel_probs.csv') as pfile:
        reader = csv.DictReader(pfile)
        for row in reader:
            x = int(row['x'])
            y = int(row['y'])
            pxy = Decimal(row['pxy'])
            pyx = Decimal(row['pyx'])
            probability_data[(x, y)] = (pxy, pyx)
    return probability_data


def parse_relation_field(text, relations_data):
    ''''''
    text = dev2wx(text)

    if text.startswith('aBihiwa') or not text.strip('-'):
        return 0, 0

    temp = text.split(',')
    relation_id = int(relations_data[temp[0]])
    parent_id = int(temp[1])

    return relation_id, parent_id


def make_relative_word_data(word_order, word_data):
    ''''''
    order_change_map = dict(zip(word_order, range(1, len(word_data) + 1)))

    relative_word_data = []

    for relative_id, original_id in enumerate(word_order):
        original_word = word_data[original_id - 1]
        original_parent_id = original_word[3]
        if original_parent_id:
            relative_parent_id = order_change_map[original_parent_id]
        else:
            relative_parent_id = 0
        relative_word_data.append([
            relative_id + 1,
            original_word[1],
            original_word[2],
            relative_parent_id])

    return relative_word_data


def well_nested(words, karakas, to_skip):
    '''Unlike the earlier version of the well-nestedness checking module, this
    may not scan every crosses. It doesn't log the list of all ill/well-nested
    trees. Instead, this returns False meeting an ill-nested crossing or if no
    ill-nested crossing met after complete scan, returns True'''

    for word in words:
        word_id = word[0]
        word_relation = word[2]
        parent_id = word[3]
        if parent_id:
            parent_relation = words[parent_id - 1][2]
            grandparent_id = words[parent_id - 1][3]
        else:
            parent_relation = 0
            grandparent_id = 0

        if abs(word_id - parent_id) == 1:
            continue

        in_range = []
        out_range = []
        record = False
        for id in range(1, len(words) + 1):
            if id in [word_id, parent_id]:
                record = not record
            elif record:
                in_range.append(id)
            else:
                out_range.append(id)

        for member_id in out_range:
            member_relation = words[member_id - 1][2]
            member_parent_id = words[member_id - 1][3]
            if member_parent_id in in_range:
                if grandparent_id == member_parent_id and \
                   parent_relation in karakas:
                    continue
                elif word_relation in to_skip or member_relation in to_skip:
                    continue
                else:
                    if (word_relation in karakas or
                        member_relation in karakas) and \
                            not (word_relation in karakas and
                                 member_relation in karakas):
                        continue
                    return False

        for member_id in in_range:
            member_relation = words[member_id - 1][2]
            member_parent_id = words[member_id - 1][3]
            if member_parent_id in out_range:
                if grandparent_id == member_parent_id and \
                   parent_relation in karakas:
                    continue
                elif word_relation in to_skip or member_relation in to_skip:
                    continue
                else:
                    if (word_relation in karakas or
                        member_relation in karakas) and \
                            not (word_relation in karakas and
                                 member_relation in karakas):
                        continue
                    return False

    return True


def calculate_probability(words, probability_data):
    ''''''
    compound_probability = Decimal(0)
    couplets = combinations(words, 2)
    for couplet in couplets:
        if couplet[0][3] != couplet[1][3]:
            continue
        one = couplet[0][2]
        two = couplet[1][2]
        # distance = abs(couplet[0][0] - couplet[1][0])
        if one == two:
            prob = Decimal(0.5)
        elif (one, two) in probability_data:
            prob = probability_data[(one, two)][0]
        elif (couplet[1][2], couplet[0][2]) in probability_data:
            prob = probability_data[(two, one)][1]
        else:
            prob = Decimal(0)
        # prob = prob / distance
        compound_probability += prob
    return compound_probability


def print_text(word_data, well_nested_orders, count):
    ''''''
    sent = ' '.join([w[1] for w in word_data])
    print(f'           Original sentence : {sent}')
    print(f'             Number of words : {len(word_data)}')
    print(f'      Number of permutations : {count}')
    print(f'Number of well-nested orders : {len(well_nested_orders)}')

    for count, order in enumerate(well_nested_orders):
        # print(' '.join([word_data[x-1][1] for x in order[0]]), order[1])
        print(' '.join([word_data[x-1][1] for x in order[0]]))


if __name__ == "__main__":
    relations_data, karakas, to_skip = load_relations()
    probability_data = load_probability_scores()
    word_data = load_data(relations_data)
    word_order_permutions = permutations(range(1, len(word_data) + 1))
    well_nested_orders = []
    for count, word_order in enumerate(word_order_permutions):
        relative_word_data = make_relative_word_data(word_order, word_data)
        if well_nested(relative_word_data, karakas, to_skip):
            prob = calculate_probability(relative_word_data, probability_data)
            well_nested_orders.append((word_order, prob))
    well_nested_orders.sort(key=lambda x: x[1], reverse=True)
    print_text(word_data, well_nested_orders, count + 1)
