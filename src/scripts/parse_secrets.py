import json 
import sys

contents=sys.argv[1]

variables = json.loads(contents, strict=False)

for k, v in variables.items():
    if k not in ["DOPPLER_CONFIG", "DOPPLER_PROJECT", "DOPPLER_ENVIRONMENT"]:
        print ("export {}=\"{}\"".format(k, v))


