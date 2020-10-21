module dSFMT_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libdSFMT

# These get calculated in __init__()
libdSFMT_handle = C_NULL
libdSFMT_path = ""

if Sys.iswindows()
    const libdSFMT = "libdSFMT.dll"
elseif Sys.isapple()
    const libdSFMT = "@rpath/libdSFMT.dylib"
else
    const libdSFMT = "libdSFMT.so"
end

function __init__()
    global libdSFMT_handle = dlopen(libdSFMT)
    global libdSFMT_path = dlpath(libdSFMT_handle)
end

end  # module dSFMT_jll
