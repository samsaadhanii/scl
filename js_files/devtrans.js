function slp2wx (itext) {
  // Converts SLP to WX Encoding
  let otext = '';
  let map = {
    'f': 'q',
    'F': 'Q',
    'x': 'L',
    'X': 'V',
    '~': 'z',
    "'": 'Z',
    'N': 'f',
    'Y': 'F',
    'w': 't',
    'W': 'T',
    'q': 'd',
    'Q': 'D',
    'R': 'N',
    't': 'w',
    'T': 'W',
    'd': 'x',
    'D': 'X',
    'z': 'R'
  };
  for (let ch of itext) {
    if (ch in map) {
      otext += map[ch];
    }
    else {
      otext += ch;
    }
  }
  return otext;
}

function wx2slp (itext) {
  // Converts WX Encoding to SLP
  let otext = '';
  let map = {
    'q': 'f',
    'Q': 'F',
    'L': 'x',
    'V': 'X',
    'z': '~',
    'Z': "'",
    'f': 'N',
    'F': 'Y',
    't': 'w',
    'T': 'W',
    'd': 'q',
    'D': 'Q',
    'N': 'R',
    'w': 't',
    'W': 'T',
    'x': 'd',
    'X': 'D',
    'R': 'z'
  };
  for (let ch of itext) {
    if (ch in map) {
      otext += map[ch];
    }
    else {
      otext += ch;
    }
  }
  return otext;
}

function slp2iast (itext) {
  // Converts SLP to Roman Diacritics (IAST)
  let otext = '';
  let map = {
    'A' : 'ā',
    'I' : 'ī',
    'U' : 'ū',
    'f' : 'ṛ',
    'F' : 'ṝ',
    'x' : 'ḷ',
    'X' : 'ḹ',
    'E' : 'ai',
    'O' : 'au',
    'M' : 'ṃ',
    'H' : 'ḥ',
    '~' : 'ṁ',
    'K' : 'kh',
    'G' : 'gh',
    'N' : 'ṅ',
    'C' : 'ch',
    'J' : 'jh',
    'Y' : 'ñ',
    'w' : 'ṭ',
    'W' : 'ṭh',
    'q' : 'ḍ',
    'Q' : 'ḍh',
    'R' : 'ṇ',
    'T' : 'th',
    'D' : 'dh',
    'P' : 'ph',
    'B' : 'bh',
    'S' : 'ś',
    'z' : 'ṣ'
  };
  for (let ch of itext) {
    if (ch in map) {
      otext += map[ch];
    }
    else {
      otext += ch;
    }
  }
  return otext;
}

function iast2slp (itext) {
  // Converts Roman Diacritics (IAST) to SLP
  let otext = '';
  let duos = {
    'ai' : 'E',
    'au' : 'O',
    'kh' : 'K',
    'gh' : 'G',
    'ch' : 'C',
    'jh' : 'J',
    'ṭh' : 'W',
    'ḍh' : 'Q',
    'th' : 'T',
    'dh' : 'D',
    'ph' : 'P',
    'bh' : 'B'
  };
  let monos = {
    'ā' : 'A',
    'ī' : 'I',
    'ū' : 'U',
    'ṛ' : 'f',
    'ṝ' : 'F',
    'ḷ' : 'x',
    'ḹ' : 'X',
    'ṃ' : 'M',
    'ḥ' : 'H',
    'ṁ' : '~',
    'ṅ' : 'N',
    'ñ' : 'Y',
    'ṭ' : 'w',
    'ḍ' : 'q',
    'ṇ' : 'R',
    'ś' : 'S',
    'ṣ' : 'z'
  };
  let now = '';
  let nxt = '';
  let i = 0;
  while (i < itext.length) {
    now = itext[i];
    if (i < itext.length - 1) {
      nxt = itext[i + 1];
    }
    else {
      nxt = '';
    }
    if (now + nxt in duos) {
      otext += duos[now + nxt];
      i++;
    }
    else if (now in monos) {
      otext += monos[now];
    }
    else {
      otext += now;
    }
    i++;
  }
  return otext;
}

function slp2dev (itext) {
  // Converts SLP to Unicode Devanagari
  let otext = '';
  let map_vow = {
    'a' : ['अ', ''],
    'A' : ['आ', 'ा'],
    'i' : ['इ', 'ि'],
    'I' : ['ई', 'ी'],
    'u' : ['उ', 'ु'],
    'U' : ['ऊ', 'ू'],
    'f' : ['ऋ', 'ृ'],
    'F' : ['ॠ', 'ॄ'],
    'x' : ['ऌ', 'ॢ'],
    'X' : ['ॡ', 'ॣ'],
    'e' : ['ए', 'े'],
    'E' : ['ऐ', 'ै'],
    'o' : ['ओ', 'ो'],
    'O' : ['औ', 'ौ']
  };
  let map_con = {
    'k' : 'क',
    'K' : 'ख',
    'g' : 'ग',
    'G' : 'घ',
    'N' : 'ङ',
    'c' : 'च',
    'C' : 'छ',
    'j' : 'ज',
    'J' : 'झ',
    'Y' : 'ञ',
    'w' : 'ट',
    'W' : 'ठ',
    'q' : 'ड',
    'Q' : 'ढ',
    'R' : 'ण',
    't' : 'त',
    'T' : 'थ',
    'd' : 'द',
    'D' : 'ध',
    'n' : 'न',
    'p' : 'प',
    'P' : 'फ',
    'b' : 'ब',
    'B' : 'भ',
    'm' : 'म',
    'y' : 'य',
    'r' : 'र',
    'l' : 'ल',
    'v' : 'व',
    'S' : 'श',
    'z' : 'ष',
    's' : 'स',
    'h' : 'ह'
  };
  let map_oth = {
    'M' : 'ं',
    'H' : 'ः',
    '~' : 'ँ',
    "'" : 'ऽ',
    '0' : '०',
    '1' : '१',
    '2' : '२',
    '3' : '३',
    '4' : '४',
    '5' : '५',
    '6' : '६',
    '7' : '७',
    '8' : '८',
    '9' : '९'
  };
  let vow_bool = false;
  let now = '';
  let nxt = '';
  let i = 0;
  while (i < itext.length) {
    now = itext[i]
    if (i < itext.length - 1) {
      nxt = itext[i+1];
    }
    else {
      nxt = '';
    }
    if (now in map_con) {
      otext += map_con[now]
      if (nxt == 'a') {
        i++;
      }
      else if (nxt in map_vow) {
        vow_bool = true;
      }
      else {
        otext += '्';
      }
    }
    else if (now in map_vow) {
      if (vow_bool) {
        otext += map_vow[now][1];
        vow_bool = false;
      }
      else {
        otext += map_vow[now][0];
      }
    }
    else if (now in map_oth) {
      otext += map_oth[now];
    }
    else if (now == '.') {
      if (nxt == '.') {
        otext += '॥';
        i++;
      }
      else {
        otext += '।';
      }
    }
    else {
      otext += now;
    }
    i++;
  }
  return otext;
}

function dev2slp (itext) {
  // Converts Unicode Devanagari to SLP
  let otext = '';
  let map_con = {
    'क' : 'k',
    'ख' : 'K',
    'ग' : 'g',
    'घ' : 'G',
    'ङ' : 'N',
    'च' : 'c',
    'छ' : 'C',
    'ज' : 'j',
    'झ' : 'J',
    'ञ' : 'Y',
    'ट' : 'w',
    'ठ' : 'W',
    'ड' : 'q',
    'ढ' : 'Q',
    'ण' : 'R',
    'त' : 't',
    'थ' : 'T',
    'द' : 'd',
    'ध' : 'D',
    'न' : 'n',
    'प' : 'p',
    'फ' : 'P',
    'ब' : 'b',
    'भ' : 'B',
    'म' : 'm',
    'य' : 'y',
    'र' : 'r',
    'ल' : 'l',
    'व' : 'v',
    'श' : 'S',
    'ष' : 'z',
    'स' : 's',
    'ह' : 'h'
  };
  let map_mar = {
    'ा': 'A',
    'ि': 'i',
    'ी': 'I',
    'ु': 'u',
    'ू': 'U',
    'ृ': 'f',
    'ॄ': 'F',
    'ॢ': 'x',
    'ॣ': 'X',
    'े': 'e',
    'ै': 'E',
    'ो': 'o',
    'ौ': 'O'
  };
  let map_oth = {
    'अ' : 'a',
    'आ' : 'A',
    'इ' : 'i',
    'ई' : 'I',
    'उ' : 'u',
    'ऊ' : 'U',
    'ऋ' : 'f',
    'ॠ' : 'F',
    'ऌ' : 'x',
    'ॡ' : 'X',
    'ए' : 'e',
    'ऐ' : 'E',
    'ओ' : 'o',
    'औ' : 'O',
    'ं' : 'M',
    'ः' : 'H',
    'ँ' : '~',
    '।' : '.',
    '॥' : '..',
    'ऽ' : "'",
    '०' : '0',
    '१' : '1',
    '२' : '2',
    '३' : '3',
    '४' : '4',
    '५' : '5',
    '६' : '6',
    '७' : '7',
    '८' : '8',
    '९' : '9'
  };
  let now = '';
  let nxt = '';
  let i = 0;
  while (i < itext.length) {
    now = itext[i];
    if (i < itext.length - 1) {
      nxt = itext[i+1];
    }
    else {
      nxt = '';
    }
    if (now in map_con) {
      otext += map_con[now]
      if (nxt == '्') {
        i++;
      }
      else if (!(nxt in map_mar)) {
        otext += 'a';
      }
    }
    else if (now in map_mar) {
      otext += map_mar[now];
    }
    else if (now in map_oth) {
      otext += map_oth[now];
    }
    else {
      otext += now;
    }
    i++;
  }
  return otext;
}

function slp2itrans (itext) {
  let otext = ''
  let map = {
    'f': 'RRi',
    'F': 'RRI',
    'x': 'LLi',
    'X': 'LLI',
    'E': 'ai',
    'O': 'au',
    '~': '.N',
    "'": '.a',
    'K': 'kh',
    'G': 'gh',
    'N': '~N',
    'c': 'ch',
    'C': 'Ch',
    'J': 'jh',
    'Y': '~n',
    'w': 'T',
    'W': 'Th',
    'q': 'D',
    'Q': 'Dh',
    'R': 'N',
    'T': 'th',
    'D': 'dh',
    'P': 'ph',
    'B': 'bh',
    'S': 'sh',
    'z': 'Sh'
  };
  for (let ch of itext) {
    if (ch in map) {
      otext += map[ch];
    }
    else {
      otext += ch;
    }
  }
  return otext;
}

function itrans2slp (itext) {
  let otext = '';
  let trios = {
    'RRi': 'f',
    'R^i': 'f',
    'RRI': 'F',
    'R^I': 'F',
    'LLi': 'x',
    'L^i': 'x',
    'LLI': 'X',
    'L^I': 'X'
  };
  let duos = {
    'aa': 'A',
    'ii': 'I',
    'uu': 'U',
    'ai': 'E',
    'au': 'O',
    '.m': 'M',
    '.n': 'M',
    '.N': '~',
    '.a': "'",
    'kh': 'K',
    'gh': 'G',
    '~N': 'N',
    'ch': 'c',
    'Ch': 'C',
    'jh': 'J',
    '~n': 'Y',
    'Th': 'W',
    'Dh': 'Q',
    'th': 'T',
    'dh': 'D',
    'ph': 'P',
    'bh': 'B',
    'sh': 'S',
    'Sh': 'z'
  };
  let monos = {
    'T': 'w',
    'D': 'q',
    'N': 'R',
    'w': 'v'
  };
  let now = '';
  let nxt = '';
  let aft = '';
  let i = 0;
  while (i < itext.length) {
    now = itext[i];
    if (i < itext.length - 1) {
      nxt = itext[i + 1];
    }
    else {
      nxt = '';
    }
    if (i < itext.length - 2) {
      aft = itext[i + 2];
    }
    else {
      aft = '';
    }
    if (now + nxt + aft in trios) {
      otext += trios[now + nxt + aft];
      i += 2;
    }
    else if (now + nxt in duos) {
      otext += duos[now + nxt];
      i++;
      // console.log(now + nxt);
    }
    else if (now in monos) {
      otext += monos[now];
      // console.log(now);
    }
    else {
      otext += now;
      // console.log(`*${now}`);
    }
    i++;
  }
  return otext;
}

function slp2vel (itext) {
  let otext = '';
  let map = {
    'A': 'aa',
    'I': 'ii',
    'U': 'uu',
    'f': '.r',
    'F': '.rr',
    'x': '.l',
    'X': '.ll',
    'E': 'ai',
    'O': 'au',
    'M': '.m',
    'H': '.h',
    '~': '/',
    "'": '.a',
    'K': 'kh',
    'G': 'gh',
    'N': '"n',
    'C': 'ch',
    'J': 'jh',
    'Y': '~n',
    'w': '.t',
    'W': '.th',
    'q': '.d',
    'Q': '.dh',
    'R': '.n',
    'T': 'th',
    'D': 'dh',
    'P': 'ph',
    'B': 'bh',
    'S': '"s',
    'z': '.s'
  };
  for (let ch of itext) {
    if (ch in map) {
      otext += map[ch];
    }
    else {
      otext += ch;
    }
  }
  return otext;
}

function vel2slp (itext) {
  let otext = '';
  let trios = {
    '.rr': 'F',
    '.ll': 'X',
    '.th': 'W',
    '.dh': 'Q'
  };
  let duos = {
    'aa': 'A',
    'ii': 'I',
    'uu': 'U',
    '.r': 'f',
    '.l': 'x',
    'ai': 'E',
    'au': 'O',
    '.m': 'M',
    '.h': 'H',
    '.a': "'",
    'kh': 'K',
    'gh': 'G',
    '"n': 'N',
    'ch': 'C',
    'jh': 'J',
    '~n': 'Y',
    '.t': 'w',
    '.d': 'q',
    '.n': 'R',
    'th': 'T',
    'dh': 'D',
    'ph': 'P',
    'bh': 'B',
    '"s': 'S',
    '.s': 'z'
  };
  let monos = {
    '/': '~'
  };
  let now = '';
  let nxt = '';
  let aft = '';
  let i = 0;
  while (i < itext.length) {
    now = itext[i];
    if (i < itext.length - 1) {
      nxt = itext[i + 1];
    }
    else {
      nxt = '';
    }
    if (i < itext.length - 2) {
      aft = itext[i + 2];
    }
    else {
      aft = '';
    }
    if (now + nxt + aft in trios) {
      otext += trios[now + nxt + aft];
      i += 2;
    }
    else if (now + nxt in duos) {
      otext += duos[now + nxt];
      i++;
    }
    else if (now in monos) {
      otext += monos[now];
    }
    else {
      otext += now;
    }
    i++;
  }
  return otext;
}

function slp2hk (itext) {
  let otext = '';
  let map = {
    'f': 'R',
    'F': 'RR',
    'x': 'lR',
    'X': 'lRR',
    'E': 'ai',
    'O': 'au',
    'K': 'kh',
    'G': 'gh',
    'N': 'G',
    'C': 'ch',
    'J': 'jh',
    'Y': 'J',
    'w': 'T',
    'W': 'Th',
    'q': 'D',
    'Q': 'Dh',
    'R': 'N',
    'T': 'th',
    'D': 'dh',
    'P': 'ph',
    'B': 'bh',
    'S': 'z',
    'z': 'S'
  };
  for (let ch of itext) {
    if (ch in map) {
      otext += map[ch];
    }
    else {
      otext += ch;
    }
  }
  return otext;
}

function hk2slp (itext) {
  let otext = '';
  let trios = {
    'lRR': 'X'
  };
  let duos = {
    'RR': 'F',
    'lR': 'x',
    'ai': 'E',
    'au': 'O',
    'kh': 'K',
    'gh': 'G',
    'ch': 'C',
    'jh': 'J',
    'Th': 'W',
    'Dh': 'Q',
    'th': 'T',
    'dh': 'D',
    'ph': 'P',
    'bh': 'B'
  };
  let monos = {
    'R': 'f',
    'G': 'N',
    'J': 'Y',
    'T': 'w',
    'D': 'q',
    'N': 'R',
    'z': 'S',
    'S': 'z'
  };
  let now = '';
  let nxt = '';
  let aft = '';
  let i = 0;
  while (i < itext.length) {
    now = itext[i];
    if (i < itext.length - 1) {
      nxt = itext[i + 1];
    }
    else {
      nxt = '';
    }
    if (i < itext.length - 2) {
      aft = itext[i + 2];
    }
    else {
      aft = '';
    }
    if (now + nxt + aft in trios) {
      otext += trios[now + nxt + aft];
      i += 2;
    }
    else if (now + nxt in duos) {
      otext += duos[now + nxt];
      i++;
    }
    else if (now in monos) {
      otext += monos[now];
    }
    else {
      otext += now;
    }
    i++;
  }
  return otext;
}
