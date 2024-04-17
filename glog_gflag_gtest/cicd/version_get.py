import json
import os
import sys

script_directory = os.path.dirname(os.path.abspath(sys.argv[0]))
meta_file = script_directory + "/meta.json"
key = sys.argv[1]
with open(meta_file) as json_file:
    data = json.load(json_file)
    print(data[key])