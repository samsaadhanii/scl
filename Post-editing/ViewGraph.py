#!/usr/bin/env python3
import os
import cgi
import subprocess
import pandas as pd  # Requires `pip install pandas openpyxl`

# Constants
UPLOAD_DIR = "/tmp/SKT_TEMP/viewgraph"
PERL_SCRIPT_PATH = "/usr/lib/cgi-bin/scl/Post-editing/ViewGraph.cgi"

# Ensure the upload directory exists
os.makedirs(UPLOAD_DIR, exist_ok=True)

def convert_to_tsv(file_path, output_path):
    """Convert Excel file to TSV format."""
    try:
        df = pd.read_excel(file_path, engine='openpyxl')
        df.to_csv(output_path, sep="\t", index=False)
    except Exception as e:
        print("Status: 500 Internal Server Error\n")
        print(f"Error converting file to TSV: {str(e)}")
        exit(1)

# Handle file upload
form = cgi.FieldStorage()
uploaded_file = form["file"]

#if not uploaded_file or not uploaded_file.filename:
#    print("Status: 400 Bad Request\n")
#    print("Error: No file uploaded")
#    exit(1)

file_name = uploaded_file.filename
file_ext = os.path.splitext(file_name)[1].lower()

# Save the uploaded file
input_filename = os.path.join(UPLOAD_DIR, f"input_{os.getpid()}{file_ext}")
with open(input_filename, "wb") as f:
    f.write(uploaded_file.file.read())

# Determine file type and convert if necessary
tsv_filename = input_filename
if uploaded_file.filename.endswith((".xls", ".xlsx")):
    tsv_filename = os.path.join(UPLOAD_DIR, f"input_{os.getpid()}.tsv")
    convert_to_tsv(input_filename, tsv_filename)

# Run the Perl script with the TSV content as input
with open(tsv_filename, "r") as tsv_file:
    perl_process = subprocess.Popen(
        [PERL_SCRIPT_PATH],
        stdin=tsv_file,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    stdout, stderr = perl_process.communicate()

# Output the result from the Perl script
if perl_process.returncode == 0:
    # Output the Perl script response (SVG) directly
    print(stdout.decode())
else:
    print("Status: 500 Internal Server Error\n")
    print(stderr.decode())
