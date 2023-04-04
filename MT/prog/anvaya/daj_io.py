#!/usr/bin/env python3

import os
import csv
import openpyxl


def load_probabilities(prob_file):
    '''Load file with relation couplet probabilities'''

    prob_data_dict = {}

    with open(prob_file) as pfile:
        reader = csv.reader(pfile, delimiter='\t')
        next(reader, None)
        for row in reader:
            prob_data_dict[row[0], row[1]] = float(row[5])
            prob_data_dict[row[1], row[0]] = float(row[6])

    return prob_data_dict


def parse_data(fname):
    '''Parses input spreadsheet file with dependency graph'''

    fexte = os.path.splitext(fname)[1].strip('.')

    data = {}

    if fexte in ('csv', 'tsv'):
        with open(fname) as ifile:
            reader = csv.reader(ifile, delimiter='\t')
            next(reader)
            for row in reader:
                if not row:
                    continue
                data[row[0]] = row[1:]

    elif fexte in ('xls', 'xlsx'):
        wb = openpyxl.load_workbook(fname)
        ws = wb.active
        for row in ws.values:
            if row[0] == 'index':
                continue
            fields = []
            for field in row:
                if type(field) in [int, float]:
                    fields.append(str(field))
                elif field is None:
                    fields.append('')
                else:
                    fields.append(field)
            data[fields[0]] = fields[1:]

    is_deptree = False

    for ind, fields in data.items():
        if len(fields) < 10:
            data[ind].extend([''] * (10 - len(fields)))
        burst = parse_relation_field(dev2wx(fields[5]))
        data[ind].extend(burst)
        if burst[0]:
            is_deptree = True

    return data, is_deptree


def parse_relation_field(text):
    '''Splits the text in kaaraka_sambandha field into Relation Name
    and Parent ID.'''

    if text.startswith('aBihiwa') or not text.strip('-'):
        return '', '', ''

    primary_rel_name = parent_id = niwya_parent_id = ''

    rels = text.split(';')
    for rel in rels:
        rel_name, p_id = rel.split(',')
        if not rel_name:
            continue
        elif rel_name.startswith('niwya'):
            niwya_parent_id = p_id
        else:
            primary_rel_name = rel_name
            parent_id = p_id

    return primary_rel_name, parent_id, niwya_parent_id


def add_order(data, word_order):
    '''Add reordered word IDs in the poem column in data dict
    and convert dict to list removing temporary columns.'''

    data_list = []
    purvapaxa_ids = []

    for ind, fields in data.items():
        parts = ind.split('.')
        if fields[0].endswith('-'):
            purvapaxa_ids.append(parts)
            continue
        data[ind][1] = str(word_order.index(ind) + 1) + '.' + parts[1]
        data_list.append([ind] + data[ind][0:10])

    # Adding purvapadas
    for parts in reversed(purvapaxa_ids):
        uwwarapaxa_id = '.'.join([parts[0], str(int(parts[1]) + 1)])
        insertion_point = 0
        for i, this_data in enumerate(data_list):
            if this_data[0] == uwwarapaxa_id:
                insertion_point = i
                break
        original_id = '.'.join(parts)
        reorder_id = data_list[insertion_point][2].split('.')[0]
        data_list.insert(
            insertion_point,
            [original_id,
             data[original_id][0],
             '.'.join([reorder_id, parts[1]])] +
            data[original_id][2:10])

    return data_list


def write_out(data, is_standalone, out_file):
    '''Write data marked with word order to output file.
    If output file is not specified print the words in the order to STDOUT'''

    header_row = [
        '@index',
        '@word',
        '@poem',
        '@sandhied_@word',
        '@morph_@analysis',
        '@morph_@in_@context',
        '@kaaraka_@sambandha',
        '@possible_@relations',
        '@color_@code',
        '@hindi_@meaning',
        '@hindi_@meaning_@active']

    if is_standalone:
        header_row = [x.replace('@', '') for x in header_row]

    if out_file:
        fexte = os.path.splitext(out_file)[1]
        if fexte == '.xlsx':
            wb = openpyxl.Workbook()
            ws = wb.active
            ws.append(header_row)
            for row in data:
                ws.append(row)
            wb.save(out_file)
        else:
            with open(out_file, 'w') as ofile:
                writer = csv.writer(ofile, delimiter='\t')
                writer.writerow(header_row)
                writer.writerows(data)
    else:
        print('Original Order:', ' '.join([x[1] for x in data]))
        data.sort(key=lambda x: float(x[2]))
        print('Anvaya Order:', ' '.join([x[1] for x in data]))


def dev2wx(src):
    '''Transliterate devanagari to WX'''
    consonants = {
        'क': 'k',
        'ख': 'K',
        'ग': 'g',
        'घ': 'G',
        'ङ': 'f',
        'च': 'c',
        'छ': 'C',
        'ज': 'j',
        'झ': 'J',
        'ञ': 'F',
        'ट': 't',
        'ठ': 'T',
        'ड': 'd',
        'ढ': 'D',
        'ण': 'N',
        'त': 'w',
        'थ': 'W',
        'द': 'x',
        'ध': 'X',
        'न': 'n',
        'प': 'p',
        'फ': 'P',
        'ब': 'b',
        'भ': 'B',
        'म': 'm',
        'य': 'y',
        'र': 'r',
        'ल': 'l',
        'व': 'v',
        'श': 'S',
        'ष': 'R',
        'स': 's',
        'ह': 'h'}
    vowel_marks = {
        'ा': 'A',
        'ि': 'i',
        'ी': 'I',
        'ु': 'u',
        'ू': 'U',
        'ृ': 'q',
        'ॄ': 'Q',
        'ॢ': 'L',
        'ॣ': 'L',
        'े': 'e',
        'ै': 'E',
        'ो': 'o',
        'ौ': 'O'}
    others = {
        'अ': 'a',
        'आ': 'A',
        'इ': 'i',
        'ई': 'I',
        'उ': 'u',
        'ऊ': 'U',
        'ऋ': 'q',
        'ॠ': 'Q',
        'ऌ': 'L',
        'ॡ': 'L',
        'ए': 'e',
        'ऐ': 'E',
        'ओ': 'o',
        'औ': 'O',
        'ं': 'M',
        'ः': 'H',
        'ँ': 'z',
        '।': '.',
        '॥': '..',
        'ऽ': 'Z',
        '०': '0',
        '१': '1',
        '२': '2',
        '३': '3',
        '४': '4',
        '५': '5',
        '६': '6',
        '७': '7',
        '८': '8',
        '९': '9'}

    tgt = ''
    inc = 0
    while inc < len(src):
        now = src[inc]
        nxt = src[inc+1] if inc < len(src) - 1 else None
        if now in consonants:
            tgt += consonants[now]
            if nxt == '्':
                inc += 1
            elif nxt not in vowel_marks:
                tgt += 'a'
        elif now in vowel_marks:
            tgt += vowel_marks[now]
        elif now in others:
            tgt += others[now]
        else:
            tgt += now
        inc += 1
    return tgt
