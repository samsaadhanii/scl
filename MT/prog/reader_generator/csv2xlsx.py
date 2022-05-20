#!/usr/bin/env python3

import sys
import pandas

pandas.read_csv(sys.argv[1], sep='\t').to_excel(sys.argv[2], index=False)
