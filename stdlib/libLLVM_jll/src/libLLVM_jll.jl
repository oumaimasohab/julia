# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/libLLVM_jll.jl

module libLLVM_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libLLVM

# These get calculated in __init__()
libLLVM_handle = C_NULL
libLLVM_path = ""

if Sys.iswindows()
    const libLLVM = "libLLVM.dll"
elseif Sys.isapple()
    const libLLVM = "libLLVM.dylib"
else
    const libLLVM = "libLLVM-11jl.so"
end

function __init__()
    global libLLVM_handle = dlopen(libLLVM)
    global libLLVM_path = dlpath(libLLVM_handle)
end

end  # module libLLVM_jll
