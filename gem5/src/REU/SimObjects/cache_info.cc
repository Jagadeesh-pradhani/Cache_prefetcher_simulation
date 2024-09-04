#include "REU/SimObjects/cache_info.hh"
#include "mem/ruby/system/RubySystem.hh"
#include "mem/ruby/structures/CacheMemory.hh"


#include "base/trace.hh"
#include "debug/CacheInfoFlag.hh"


namespace gem5
{

CacheInfo::CacheInfo(const Params &params):
    SimObject(params)
{
    DPRINTF(CacheInfoFlag, "%s: Hello World! From a "
                    "SimObject (constructor).\n", __func__);
}



} // namespace gem5