# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/Zlib_jll.jl
module Zlib_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libz

# These get calculated in __init__()
libz_handle = C_NULL
libz_path = ""

if Sys.iswindows()
    const libz = "libz-1.dll"
elseif Sys.isapple()
    const libz = "@rpath/libz.1.dylib"
else
    const libz = "libz.so.1"
end

function __init__()
    global libz_handle = dlopen(libz)
    global libz_path = dlpath(libz_handle)
end

end  # module Zlib_jll
