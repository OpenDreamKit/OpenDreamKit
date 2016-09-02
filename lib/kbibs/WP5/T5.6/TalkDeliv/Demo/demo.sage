"""
Map reduce in Python Demo
=========================


Enumerating binary vectors::

    sage: S = RecursivelyEnumeratedSet(
    ....:   [[]], lambda l: [l+[0], l+[1]] if len(l) <= 15 else [],
    ....:   structure='forest', enumeration='depth')
    sage: S.map_reduce(
    ....:   map_function = lambda x: 1,
    ....:   reduce_function = lambda x,y: x+y,
    ....:   reduce_init = 0 )
    131071

Enumerating Permutation::

    sage: S = RecursivelyEnumeratedSet( [[]],
    ....:   lambda l: ([l[:i] + [len(l)] + l[i:] for i in range(len(l)+1)]
    ....:               if len(l) < 8 else []),
    ....:   structure='forest', enumeration='depth')
    sage: sp = S.map_reduce(lambda z: x**len(z)); sp
    40320*x^8 + 5040*x^7 + 720*x^6 + 120*x^5 + 24*x^4 + 6*x^3 + 2*x^2 + x + 1

Using Cilk through sage to enumerate mumerical monoids::

    sage: import os; os.sys.path.insert(0,os.path.abspath('.')); from numeric_monoid import *
    sage: %attach mred.sage

Using Cilk:

    sage: %time Full.walk_children(30) # Tune depending the speed of the machine
    sage: lst = _
    sage: nb = sum(lst); nb

Using map_reduce to generate the 15-th generation:

    sage: CGenCount(15).run()

Using mixed algorithms : map_reduce + Cilk

    sage: CGenCountMixed(15,30).run()

"""
