# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/LibUV_jll.jl

module LibUV_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libuv

# These get calculated in __init__()
libuv_handle = C_NULL
libuv_path = ""

if Sys.iswindows()
    const libuv = "libuv-2.dll"
elseif Sys.isapple()
    const libuv = "libuv.2.dylib"
else
    const libuv = "libuv.so.2"
end

function __init__()
    global libuv_handle = dlopen(libuv)
    global libuv_path = dlpath(libuv_handle)
end

end  # module LibUV_jll
