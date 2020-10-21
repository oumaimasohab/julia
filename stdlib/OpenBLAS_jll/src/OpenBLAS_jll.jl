# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/OpenBLAS_jll.jl
module OpenBLAS_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libopenblas

# These get calculated in __init__()
libopenblas_handle = C_NULL
libopenblas_path = ""

if Sys.iswindows()
    if Sys.WORD_SIZE == 64
        const libopenblas = "libopenblas64_.dll"
    else
        const libopenblas = "libopenblas.dll"
    end
elseif Sys.isapple()
    if Sys.WORD_SIZE == 64
        const libopenblas = "@rpath/libopenblas64_.dylib"
    else
        const libopenblas = "@rpath/libopenblas.dylib"
    end
else
    if Sys.WORD_SIZE == 64
        const libopenblas = "libopenblas64_.so"
    else
        const libopenblas = "libopenblas.so"
    end
end

function __init__()
    global libopenblas_handle = dlopen(libopenblas)
    global libopenblas_path = dlpath(libopenblas_handle)
end

end  # module OpenBLAS_jll
