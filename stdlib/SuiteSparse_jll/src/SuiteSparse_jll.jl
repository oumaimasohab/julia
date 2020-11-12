# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/SuiteSparse_jll.jl
module SuiteSparse_jll

using Libdl, OpenBLAS_jll

const PATH_list = String[]
const LIBPATH_list = String[]

export libamd, libcamd, libccolamd, libcholmod, libcolamd, libspqr, libsuitesparse_wrapper, libsuitesparseconfig, libumfpack

# These get calculated in __init__()
# Man I can't wait until these are automatically handled by an in-Base JLLWrappers clone.
libamd_handle = C_NULL
libamd_path = ""
libcamd_handle = C_NULL
libcamd_path = ""
libccolamd_handle = C_NULL
libccolamd_path = ""
libcholmod_handle = C_NULL
libcholmod_path = ""
libcolamd_handle = C_NULL
libcolamd_path = ""
libspqr_handle = C_NULL
libspqr_path = ""
libsuitesparse_wrapper_handle = C_NULL
libsuitesparse_wrapper_path = ""
libsuitesparseconfig_handle = C_NULL
libsuitesparseconfig_path = ""
libumfpack_handle = C_NULL
libumfpack_path = ""

if Sys.iswindows()
    const libamd = "libamd.dll"
    const libcamd = "libcamd.dll"
    const libccolamd = "libccolamd.dll"
    const libcholmod = "libcholmod.dll"
    const libcolamd = "libcolamd.dll"
    const libspqr = "libspqr.dll"
    const libsuitesparse_wrapper = "libsuitesparse_wrapper.dll"
    const libsuitesparseconfig = "libsuitesparseconfig.dll"
    const libumfpack = "libumfpack.dll"
elseif Sys.isapple()
    const libamd = "@rpath/libamd.2.dylib"
    const libcamd = "@rpath/libcamd.2.dylib"
    const libccolamd = "@rpath/libccolamd.2.dylib"
    const libcholmod = "@rpath/libcholmod.3.dylib"
    const libcolamd = "@rpath/libcolamd.2.dylib"
    const libspqr = "@rpath/libspqr.2.dylib"
    const libsuitesparse_wrapper = "@rpath/libsuitesparse_wrapper.dylib"
    const libsuitesparseconfig = "@rpath/libsuitesparseconfig.5.dylib"
    const libumfpack = "@rpath/libumfpack.5.dylib"
else
    const libamd = "libamd.so.2"
    const libcamd = "libcamd.so.2"
    const libccolamd = "libccolamd.so.2"
    const libcholmod = "libcholmod.so.3"
    const libcolamd = "libcolamd.so.2"
    const libspqr = "libspqr.so.2"
    const libsuitesparse_wrapper = "libsuitesparse_wrapper.so"
    const libsuitesparseconfig = "libsuitesparseconfig.so.5"
    const libumfpack = "libumfpack.so.5"
end

function __init__()
    global libamd_handle = dlopen(libamd)
    global libamd_path = dlpath(libamd_handle)
    global libcamd_handle = dlopen(libcamd)
    global libcamd_path = dlpath(libcamd_handle)
    global libccolamd_handle = dlopen(libccolamd)
    global libccolamd_path = dlpath(libccolamd_handle)
    global libcholmod_handle = dlopen(libcholmod)
    global libcholmod_path = dlpath(libcholmod_handle)
    global libcolamd_handle = dlopen(libcolamd)
    global libcolamd_path = dlpath(libcolamd_handle)
    global libspqr_handle = dlopen(libspqr)
    global libspqr_path = dlpath(libspqr_handle)
    global libsuitesparse_wrapper_handle = dlopen(libsuitesparse_wrapper)
    global libsuitesparse_wrapper_path = dlpath(libsuitesparse_wrapper_handle)
    global libsuitesparseconfig_handle = dlopen(libsuitesparseconfig)
    global libsuitesparseconfig_path = dlpath(libsuitesparseconfig_handle)
    global libumfpack_handle = dlopen(libumfpack)
    global libumfpack_path = dlpath(libumfpack_handle)
end

end  # module SuiteSparse_jll
