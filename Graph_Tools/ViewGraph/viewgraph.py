#!/usr/bin/env python3

import re
import os
import sys
import numpy
import pandas
from graphviz import Digraph


def paint(morph, code=False):
    colors = {
        'N1': ('#00BFFF', 'deepskyblue'),
        'N2': ('#7CFC00', 'lawngreen'),
        'N3': ('#40E0D0', 'turquoise'),
        'N4': ('#87CEFA', 'lightskyblue'),
        'N5': ('#90EE90', 'lightgreen'),
        'N6': ('#87CEEB', 'skyblue'),
        'N7': ('#708090', 'slategray'),
        'N8': ('#7FFFD4', 'aquamarine'),
        'NA': ('#FF00FF', 'magenta'),
        'KP': ('#FF6347', 'tomato'),
        'ER': ('#808080', 'gray'),  # Error
    }
    ind = 0 if code else 1
    vibha = re.search(r';(\d+)', morph)
    if vibha:
        return colors['N' + vibha.group(1)][ind]
    elif re.search('{अव्य', morph):
        return colors['NA'][ind]
    elif re.search('(परस्मै|आत्मने)पदी', morph):
        return colors['KP'][ind]
    return colors['ER'][ind]


def build_graph(data):
    graph = Digraph(comment=' '.join(data['word']), format='svg')
    graph.attr('graph', bgcolor='lemonchiffon1')
    graph.attr('node', style='filled')
    edges = []
    share = []
    nitya = []
    for _, fields in data.iterrows():
        w_id = word = morph = rela = p_id = None
        w_id = str(fields[0])
        word = fields[1]
        morph = fields[2]
        try:
            rela, p_id = fields[3].split(',')
        except ValueError:
            pass
        graph.node(w_id, f'{word} ({w_id})',
                   color=paint(morph, code=True), tooltip=morph)
        if rela:
            if not rela.startswith('अभिहित'):
                edges.append((p_id, w_id, rela))
            if rela.startswith('पूर्वकाल'):
                share.append((p_id, w_id, rela))
        temp = re.match(r'(नित्य_?सम्बन्धः?),(\d+)', fields[4])
        if temp:
            nit_rela, nit_p_id = temp.groups()
            nitya.append((nit_p_id, w_id, nit_rela))

    for pare, word, rela in edges:
        if rela.startswith('नित्य'):
            graph.edge(pare, word, rela, style='dotted')
        else:
            graph.edge(pare, word, rela)
        for shared_p_id, shared_w_id, shared_rela in share:
            if pare == shared_p_id and rela == 'कर्ता':
                graph.edge(shared_w_id, word, rela, style='dotted')
    for pare, word, rela in nitya:
        graph.edge(pare, word, rela, style='dotted')
    return graph


def read_render(ex_file):
    base_name = os.path.splitext(ex_file)[0]

    headers = ['anvaya_no', 'word', 'morph_in_context',
               'kaaraka_sambandha', 'sarvanAma']

    data = pandas.read_excel(ex_file, usecols='A,B,F,G,L', dtype=str,
                             names=headers, engine='openpyxl')
    data.dropna(how='all', inplace=True)
    data.replace(r'^\s+$', numpy.nan, regex=True, inplace=True)
    for i, fields in data.iterrows():
        if type(fields['anvaya_no']) != str or \
                not re.match(r'\d+', fields['anvaya_no']):
            data.drop(index=i, inplace=True)
    data.fillna('-', inplace=True)

    for col in ['anvaya_no', 'kaaraka_sambandha']:
        data[col] = data[col].str.translate(
            str.maketrans('०१२३४५६७८९', '0123456789'))

    graph = build_graph(data)
    graph.render(base_name)


if __name__ == "__main__":
    abs_path = os.path.abspath(sys.argv[1])

    if len(sys.argv) > 2 and sys.argv[2] == '--bulk':
        ex_files = [os.path.join(abs_path, x)
                    for x in os.listdir(abs_path)
                    if os.path.splitext(x)[1] == '.xlsx']
    else:
        ex_files = [abs_path]

    for ex_file in ex_files:
        read_render(ex_file)
