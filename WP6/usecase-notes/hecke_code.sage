# Code to extract Hecke field data from the LMFDB and process it in Sage (May 2018)

#  Connect to the LMFDB and authenticate (read-only):

import pymongo
#C = pymongo.MongoClient(host='lmfdb-ib', port=int(37010))
C = pymongo.MongoClient(host='m0.lmfdb.xyz')
C.admin.authenticate('lmfdb','lmfdb')

# assign names to the relevant collections:

hmfs = C.hmfs
fields = hmfs.fields
forms = hmfs.forms
hecke = hmfs.hecke

# Define a utility for converting a polynomial in x stored as a
# string to a Sage polynomial in QQ[x]. [1]

Qx = PolynomialRing(QQ,'x') # 'x' is the variable used in the hecke collection
def decode_poly(pol):
    return Qx(str(pol))

# Fix a base field degree and a Hecke field degree (dimension). [2]

deg = int(2)
dim = int(2)

# Fetch the Hilbert newforms with this degree and dimension, and extract their labels:

res = forms.find({'deg':deg, 'dimension':dim})
labels = [f['label'] for f in res]
nforms = len(labels)

# Fetch the Hecke polynomials for each of these, converting each from a string to a Sage polynomial: [3]

data = {}
for lab in labels:
    data[lab] = dat = {}
    dat['hecke_pol'] = hecke.find_one({'label':lab}, projection=['hecke_polynomial'])['hecke_polynomial']
    dat['hecke_pol'] = decode_poly(dat['hecke_pol'])

# At this point the dictionary 'data' has HMF labels as keys, and
# their Hecke polynomials as values, and we can use SageMath functions
# to work with these.  Here we merely construct the associated Hecke
# fields, and record their discriminants, counting how many times each
# field occurs. [4]

disc_counts = {}
for lab in labels:
    dat = data[lab]
    dat['hecke_field'] = H = NumberField(dat['hecke_pol'],'a')
    dat['hecke_disc'] = D = H.disc()
    disc_counts[D] = disc_counts.get(D,0)+1

# Output a list of which discriminants occur and with what frequency:

Hpols = Set([data[lab]['hecke_pol'] for lab in data])
Hfields = Set([data[lab]['hecke_disc'] for lab in data])
print("The {} newforms have {} different Hecke polynomials, but only {} different Hecke fields".format(len(data), len(Hpols), len(Hfields)))
print("Multiplicities of different Hecke field discriminants")
print("disc(H)\tMultiplicity")
for D in sorted(disc_counts.keys()):
    print("{}\t{}".format(D,disc_counts[D]))
