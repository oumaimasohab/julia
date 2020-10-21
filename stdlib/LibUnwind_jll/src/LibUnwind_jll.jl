# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/LibUnwind_jll.jl

module LibUnwind_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libunwind

# These get calculated in __init__()
libunwind_handle = C_NULL
libunwind_path = ""

const libunwind = "libunwind.so.8"

function __init__()
    # We only do something on Linux/FreeBSD
    @static if Sys.islinux() || Sys.isfreebsd()
        global libunwind_handle = dlopen(libunwind)
        global libunwind_path = dlpath(libunwind_handle)
    end
end

end  # module LibUnwind_jll
