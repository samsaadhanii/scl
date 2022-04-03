#!/usr/bin/env python3

import os
import csv
import pandas
import itertools
import reorder_max

CSV_PATH = '/home/gaudha/Projects/ereaders/raghuvamsa/data'
OUT_FILE = 'rel_probs.csv'


def csv2df(csvfname, rel_dict):
    '''Read CSVs with dependency graph and
    returns the Pandas dataframe'''

    data = pandas.read_csv(csvfname, sep='\t', usecols=[0, 1, 6],
                           names=['w_id', 'word', 'rela'])
    data.drop(0, inplace=True)
    data.dropna(how='all', inplace=True)

    for ind, fields in data.iterrows():
        rela, p_id = -1, -1
        if type(fields.rela) == float or \
           fields.rela.startswith('aBihiwa') or \
           fields.rela.find('karmaka') >= 0 or \
           not fields.rela.strip('-'):
            pass
        else:
            rela, p_id = fields.rela.strip().split(',')
            rela = rel_dict[rela]
            p_id = int(p_id.strip())
        data.at[ind, 'rela'] = rela
        data.at[ind, 'p_id'] = p_id
    data = data.astype({'w_id': int, 'rela': int, 'p_id': int})

    return data


def get_couplets(data):
    ''''''
    couplets = []

    parents = dict()
    for parent in list(data.p_id):
        if parent in parents:
            parents[parent] += 1
        else:
            parents[parent] = 1
    parents = [x for x, y in parents.items() if y > 1]

    for parent in parents:
        child_rel = list(data[data['p_id'] == parent].rela)
        couplets.extend(list(itertools.combinations(child_rel, 2)))

    return couplets


def calc_dist(couplets):
    ''''''
    couplet_dist = dict()

    for couplet in couplets:
        if couplet[0] == couplet[1] or couplet[0] == -1 or couplet[1] == -1:
            continue

        is_sorted = False
        srt_couplet = tuple(sorted(couplet))
        if couplet == srt_couplet:
            is_sorted = True

        if srt_couplet in couplet_dist:
            if is_sorted:
                couplet_dist[srt_couplet][0] += 1
            else:
                couplet_dist[srt_couplet][1] += 1
        else:
            if is_sorted:
                couplet_dist[srt_couplet] = [1, 0]
            else:
                couplet_dist[srt_couplet] = [0, 1]

    return couplet_dist


def adjust_for_raghuvamsa(rel_dict):
    ''''''
    for rel_name, rel_numb in rel_dict.copy().items():
        if rel_name.endswith('xyowakaH'):
            rel_dict[rel_name.replace('_xyowakaH', 'xyowakaH')] = rel_numb
    rel_dict['karwqsamAnAXikaraNam'] = rel_dict['viXeya_viSeRaNam']
    rel_dict['GatakaH'] = rel_dict['Gataka']
    return rel_dict


if __name__ == "__main__":
    rel_dict, _, _ = reorder_max.load_relations()
    rel_dict = adjust_for_raghuvamsa(rel_dict)
    all_couplets = []

    for csv_file in os.listdir(CSV_PATH):
        if os.path.splitext(csv_file)[1] != '.csv':
            continue
        data = csv2df(os.path.join(CSV_PATH, csv_file), rel_dict)
        all_couplets.extend(get_couplets(data))

    distribution = calc_dist(all_couplets)

    ofile = open(OUT_FILE, 'w')
    writer = csv.writer(ofile)
    writer.writerow(['x', 'y', 's', 'xy', 'pxy', 'yx', 'pyx'])

    for couple, dist in distribution.items():
        x = couple[0]   # rel 1
        y = couple[1]   # rel 2
        xy = dist[0]    # number of occurances rel 1 precedes rel 2
        yx = dist[1]    # number of occurances rel 1 follows rel 2
        s = xy + yx     # number of occurances rel 1 and rel 2 comes together
        pxy = xy / s    # probability of xy
        pyx = yx / s    # probability of yx
        writer.writerow([x, y, s, xy, pxy, yx, pyx])

    ofile.close()
