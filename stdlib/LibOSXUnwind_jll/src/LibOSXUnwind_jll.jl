# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/LibOSXUnwind_jll.jl

module LibOSXUnwind_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libosxunwind

# These get calculated in __init__()
libosxunwind_handle = C_NULL
libosxunwind_path = ""

const libosxunwind = "@rpath/libosxunwind.dylib"

function __init__()
    # We only do something on MacOS
    @static if Sys.isapple()
        global libosxunwind_handle = dlopen(libosxunwind)
        global libosxunwind_path = dlpath(libosxunwind_handle)
    end
end

end  # module LibOSXUnwind_jll
