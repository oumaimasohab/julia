# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/PCRE2_jll.jl
module PCRE2_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libpcre2_8, libpcre2_16, libpcre2_32

# These get calculated in __init__()
libpcre2_8_handle = C_NULL
libpcre2_8_path = ""
libpcre2_16_handle = C_NULL
libpcre2_16_path = ""
libpcre2_32_handle = C_NULL
libpcre2_32_path = ""

if Sys.iswindows()
    const libpcre2_8 = "libpcre2-8-0.dll"
    const libpcre2_16 = "libpcre2-16-0.dll"
    const libpcre2_32 = "libpcre2-32-0.dll"
elseif Sys.isapple()
    const libpcre2_8 = "@rpath/libpcre2-8.0.dylib"
    const libpcre2_16 = "@rpath/libpcre2-16.0.dylib"
    const libpcre2_32 = "@rpath/libpcre2-32.0.dylib"
else
    const libpcre2_8 = "libpcre2-8.so.0"
    const libpcre2_16 = "libpcre2-16.so.0"
    const libpcre2_32 = "libpcre2-32.so.0"
end

function __init__()
    global libpcre2_8_handle = dlopen(libpcre2_8)
    global libpcre2_8_path = dlpath(libpcre2_8_handle)
    global libpcre2_16_handle = dlopen(libpcre2_16)
    global libpcre2_16_path = dlpath(libpcre2_16_handle)
    global libpcre2_32_handle = dlopen(libpcre2_32)
    global libpcre2_32_path = dlpath(libpcre2_32_handle)
end

end  # module PCRE2_jll
