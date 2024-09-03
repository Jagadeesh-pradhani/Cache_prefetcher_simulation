from m5.params import *
from m5.proxy import *
from m5.SimObject import SimObject

class CacheInfo(SimObject):
    type = "CacheInfo"
    cxx_header = "REU/SimObjects/cache_info.hh"
    cxx_class = "gem5::CacheInfo"

    number_of_greets = Param.Int(1, "Number of times to greet.")
