# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/LibGit2_jll.jl

module LibGit2_jll

using Libdl
using MbedTLS_jll, LibSSH2_jll

const PATH_list = String[]
const LIBPATH_list = String[]

export libgit2

# These get calculated in __init__()
libgit2_handle = C_NULL
libgit2_path = ""

if Sys.iswindows()
    const libgit2 = "libgit2.dll"
elseif Sys.isapple()
    const libgit2 = "libgit2.1.1.dylib"
else
    const libgit2 = "libgit2.so.1.1"
end

function __init__()
    global libgit2_handle = dlopen(libgit2)
    global libgit2_path = dlpath(libgit2_handle)
end

end  # module LibGit2_jll
