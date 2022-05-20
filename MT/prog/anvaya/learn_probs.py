#!/usr/bin/env python3

import os
import re
import csv
import numpy
import pandas
import itertools

import daj_io

MY_HOME = os.path.expanduser('~')

SCL_PATH = os.path.join(MY_HOME, 'Projects/scl')
CSVS_PATH = [os.path.join(MY_HOME, 'Projects/ereaders', book, 'analysis')
             for book in [
                'bhagavadgita',
                'mahabharata',
                'sankseparamayana',
                'raghuvamsa',
            ]]
GOLD_PATH = os.path.join(SCL_PATH, 'GOLD_DATA/Dependency_analysis')

OUT_FILE = 'rel_probs.csv'
LOG_FILE = 'logs/error_log.csv'


def parse_csv(csv_file):
    ''''''
    dataframe = pandas.read_csv(csv_file, sep='\t', usecols=[0, 1, 2, 6])
    return dataframe, csv_file


def parse_txt(txt_file):
    '''Parses text files in GOLD_DATA/Dependency_analysis,
    extracts dependency trees and returns corresponding dataframes'''

    dataframes = []

    with open(txt_file) as ifile:
        lines = ifile.readlines()

    for line in lines:
        if re.match(r'^\d', line):
            if re.search('\t', line):
                delim = '\t'
            else:
                delim = ' '
            break

    for i, line in enumerate(lines):
        line = re.sub(r' {2,}', ' ', line)
        if re.match(r'^\d', line):
            fields = line.strip().split(delim)
            index = fields[0]
            word = fields[1]
            try:
                if delim == '\t':
                    rela = fields[2]
                else:
                    if re.search(r'\d', fields[3]):
                        rela = f'{fields[2]},{fields[3]}'
                    else:
                        rela = ''
            except IndexError:
                rela = ''
            if index == '1':
                data_tree = {
                    'index': [index],
                    'word': [word],
                    'poem': [''],
                    'kaaraka_sambandha': [rela]}
            else:
                data_tree['index'].append(index)
                data_tree['word'].append(word)
                data_tree['poem'].append('')
                data_tree['kaaraka_sambandha'].append(rela)
        elif not line.strip():
            try:
                data = pandas.DataFrame(data_tree)
                if any(data['kaaraka_sambandha']):
                    dataframes.append((data, txt_file))
            except UnboundLocalError:
                pass
    return dataframes


def extract_couplets(data):
    ''''''
    rela_dict = {}

    data['kaaraka_sambandha'].replace(numpy.nan, '', inplace=True)

    all_rela = list(data['kaaraka_sambandha'])
    for rela_text in all_rela:
        if rela_text.startswith('aBihiw'):
            continue
        relas = rela_text.split(';')
        for rela in relas:
            fields = rela.split(',')
            if len(fields) != 2:
                continue
            rela = fields[0]
            rela = sanitize(rela)
            p_id = fields[1]
            if p_id in rela_dict:
                rela_dict[p_id].append(rela)
            else:
                rela_dict[p_id] = [rela]

    couplets = []
    for relas in rela_dict.values():
        if len(relas) < 2:
            continue
        for one, two in itertools.combinations(relas, 2):
            if one != two:
                couplets.append((one, two))

    return couplets


def sanitize(rela):
    ''''''
    typo_map = {
        'aBihikarwA': 'aBihiwa_karwA',
        # 'aBiXA_xyowakaH': 'aBiXA_xyowakaH',
        # 'aBiXA': 'aBiXA',
        'awyanwasaMyogaH': 'awyanwasaMyoga_sambanXaH',
        'aXikaraNm': 'aXikaraNam',
        'aXikarakaNam': 'aXikaraNam',
        # 'BAvalakRaNasapwamI': 'BAvalakRaNasapwamI',
        'BAvalakRaNAsapwamI_pUrvakAlaH': 'BAvalakRaNasapwamI_pUrvakAlaH',
        'BAvalakRaNAsapwamI_samAnakAlaH': 'BAvalakRaNasapwamI_samAnakAlaH',
        # 'BaviRyawsamAnakAlaH': 'BaviRyawsamAnakAlaH',
        'GatakaH': 'Gataka',
        # 'hewu_xyowakaH': 'hewu_xyowakaH',
        'hewu': 'hewuH',
        'kAlAXikaraN': 'kAlAXikaraNam',
        # 'karaNamkriyAviSeRaNam': 'karaNamkriyAviSeRaNam',
        'karm': 'karma',
        # 'karma_xyowakaH': 'karma_xyowakaH',
        'karmasamAnAXikaraNaNam': 'karmasamAnAXikaraNam',
        # 'karmasamAnAXikaraNa_xyowakaH': 'karmasamAnAXikaraNa_xyowakaH',
        # 'karmasamucciwam': 'karmasamucciwam',
        'karwasamAnAXikaraNam': 'viXeya_viSeRaNam',
        'karwqsamAnAXikaraNa': 'viXeya_viSeRaNam',
        'karwqsamAnAxikaraNam': 'viXeya_viSeRaNam',
        'karwqsamAnAXikaraNam': 'viXeya_viSeRaNam',
        'karwrusamAnARikaraNam': 'viXeya_viSeRaNam',
        # 'kriyAviSeRaNamkAlAXi': 'kriyAviSeRaNamkAlAXi',
        # 'lupwakriyAkarma': 'lupwakriyAkarma',
        # 'maXyasWakarwA': 'maXyasWakarwA',
        'muccaya_xyowakaH': 'samuccaya_xyowakaH',
        # 'niReXyaH': 'niReXyaH',
        'niwyasambanXaH': 'niwya_sambanXaH',
        # 'paryApwaH': 'paryApwaH',
        # 'saha_karwA': 'saha_karwA',
        # 'samAnakAlaH': 'samAnakAlaH',
        # 'samAnaXarma': 'samAnaXarma',
        'saMbaMXa': 'sambanXaH',
        'saMbanXaH': 'sambanXaH',
        'sambanXa': 'sambanXaH',
        'samboXanam': 'samboXyaH',
        'samboXanasUcakam': 'samboXana_xyowakaH',
        'saMboXya': 'samboXyaH',
        'samboXya': 'samboXyaH',
        'samBoXyaH': 'samboXyaH',
        'samuccaya_xyowaka': 'samuccaya_xyowakaH',
        'samuccaya_xyowakam': 'samuccaya_xyowakaH',
        'samuccayaboXakaH': 'samuccaya_xyowakaH',
        # 'samucciwakarwA': 'samucciwakarwA',
        'samucciwam': 'samucciwaH',
        'samucyaya_xyowakaH': 'samuccaya_xyowakaH',
        'samuuccaya_xyowakaH': 'samuccaya_xyowakaH',
        'sap_samucciwam': 'sup_samucciwaH',
        'sup_samucciwam': 'sup_samucciwaH',
        'sup_samuucciwam': 'sup_samucciwaH',
        'supa_samucciwam': 'sup_samucciwaH',
        'supsamamucciwam': 'sup_samucciwaH',
        'supsamucciwam': 'sup_samucciwaH',
        'supsamucciwama': 'sup_samucciwaH',
        'supsmucciwam': 'sup_samucciwaH',
        'suup_anyawaraH': 'sup_anyawaraH',
        # 'upapaxasambanXaH': 'upapaxasambanXaH',
        # 'uwprekRa': 'uwprekRa',
        'vAAkyakarma': 'vAkyakarma',
        # 'vAkya_xyowakakarma': 'vAkya_xyowakakarma',
        # 'vAkyakarya': 'vAkyakarya',
        'varwamAnasamAkAlaH': 'varwamAnasamAnakAlaH',
        'varwamAnasamAnasamAnakAlaH': 'varwamAnasamAnakAlaH',
        # 'viBakwam': 'viBakwam',
        # 'viBakwama': 'viBakwama',
        'viSeRam': 'viSeRaNam',
        'viSeeRaNam': 'viSeRaNam',
        'viSeRaNama': 'viSeRaNam',
        # 'viSeRaNasUcakam': 'viSeRaNasUcakam',
        # 'vismaya_xyowakaH': 'vismaya_xyowakaH',
        'viXeya-viSeRaNam': 'viXeya_viSeRaNam',
        'wIrvawAxarSI': 'wIvrawAxarSI',
        # 'wAxarWyam': 'wAxarWyam',
        'wulanAbinxuH': 'wulanA_binxuH',
    }

    rela = re.sub(r'[^a-zA-Z0-9,;_-]', '', rela)
    rela = re.sub(r'([^_])xyowaka', r'\1_xyowaka', rela)
    rela = re.sub(r'M$', 'm', rela)
    if rela in typo_map:
        rela = typo_map[rela]

    return rela


def log_mismatch(oov_relas, rela_data, fname, *relas):
    ''''''
    for rela in relas:
        if not rela:
            continue
        if rela not in rela_data:
            if rela in oov_relas:
                oov_relas[rela].add(fname)
            else:
                oov_relas[rela] = {fname}
    return oov_relas


if __name__ == "__main__":
    rela_data = daj_io.load_relations(os.path.join(
        SCL_PATH,
        'MT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA',
        'relations.txt'))

    all_data = []

    for csv_path in CSVS_PATH:
        csv_files = os.listdir(csv_path)
        for csv_file in csv_files:
            dataframe = parse_csv(os.path.join(csv_path, csv_file))
            all_data.append(dataframe)

    txt_files = [x for x in os.listdir(GOLD_PATH)
                 if os.path.splitext(x)[1] == '.txt']

    for txt_file in txt_files:
        dataframes = parse_txt(os.path.join(GOLD_PATH, txt_file))
        all_data.extend(dataframes)

    freq_dist = {}

    oov_relas = {}  # Out of vocabulary relations

    for data, fname in all_data:
        couplets = extract_couplets(data)
        for one, two in couplets:
            if one not in rela_data or two not in rela_data:
                oov_relas = log_mismatch(oov_relas, rela_data, fname, one, two)
                continue

            couplet = (rela_data[one], rela_data[two])
            sorted_couplet = tuple(sorted(couplet))
            freq_indx = 0 if couplet == sorted_couplet else 1

            if sorted_couplet not in freq_dist:
                freq_dist[sorted_couplet] = [0, 0]
            freq_dist[sorted_couplet][freq_indx] += 1

    ofile = open(OUT_FILE, 'w')
    writer = csv.writer(ofile, delimiter='\t')
    writer.writerow(['x', 'y', 's', 'xy', 'yx', 'pxy', 'pyx'])

    count_couplets = 0
    count_distributions = 0
    for couplet in sorted(freq_dist.keys()):
        x = couplet[0]
        y = couplet[1]
        xy = freq_dist[couplet][0]
        yx = freq_dist[couplet][1]
        s = xy + yx
        pxy = round(xy / s, 3)
        pyx = round(yx / s, 3)
        writer.writerow([x, y, s, xy, yx, pxy, pyx])
        count_couplets += 1
        count_distributions += s

    ofile.close()

    print(f'Learned probabilities of {count_couplets} couplets', end=' ')
    print(f'from a total of {count_distributions} valid occurances')
    print(f'Output is written in {OUT_FILE} file')

    with open(LOG_FILE, 'w') as efile:
        for rela in sorted(oov_relas.keys()):
            efile.write('## ' + rela + '\n')
            efile.write('\t' + '\n\t'.join(sorted(oov_relas[rela])) + '\n')

    print(f'Log of mismatched relation names is stored in {LOG_FILE} file')
