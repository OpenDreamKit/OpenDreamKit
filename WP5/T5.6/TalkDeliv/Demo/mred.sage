import numeric_monoid as nm
from sage.parallel.map_reduce import RESetMapReduce as MR

class CGenCount(MR):
    def __init__(self, g):
        MR.__init__(self)
        self._g = g
    def roots(self):
        return [nm.Full]
    def children(self, x):
        return x.children() if x.genus() < self._g else []
    def post_process(self, x):
        return 1 if x.genus() == self._g else None

class CGenCountMixed(MR):
    def __init__(self, seuil, g):
        MR.__init__(self)
        self._seuil = seuil
        self._g = g
    def roots(self):
        return [nm.Full]
    def children(self, x):
        return x.children() if x.genus() < self._seuil else []
    def post_process(self, x):
        return x if x.genus() == self._seuil else None
    def map_function(self, x):
        return len(x.nth_generation(self._g))

class CGen(CGenCount):
    def __init__(self, g):
        MR.__init__(self)
        self._g = g
    def roots(self):
        return [nm.Full]
    def children(self, x):
        return x.children() if x.genus() < self._g else []
    def post_process(self, x):
        return x if x.genus() == self._g else None
    def reduce_init(self):
        return []
    def map_function(self, x):
        return [x]


# def cgen(g):
#     calc = MR(
#         roots=[nm.Full],
#         children=lambda x : x.children() if x.genus() < g else [],
#         post_process=lambda x : x if x.genus() == g else None,
#         reduce_init=[],
#         map_function=lambda x : [x]
#     )
#     return calc.run()




