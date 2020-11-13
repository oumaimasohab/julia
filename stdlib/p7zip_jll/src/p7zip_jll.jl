# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/p7zip_jll.jl
module p7zip_jll

const PATH_list = String[]
const LIBPATH_list = String[]

export p7zip

# This gets calculated in __init__()
p7zip_path = ""
if Sys.iswindows()
    const p7zip_exe = "7z"
else
    const p7zip_exe = "7z.exe"
end

# These functions look a little strange, but they're mimicking the JLLWrappers signature
p7zip(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true) = f(p7zip_path)
p7zip(; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true) = Cmd([p7zip_path])

function __init__()
    # Prefer our own bundled p7zip, but if we don't have one, pick it up off of the PATH
    bundled_p7zip_path = joinpath(Sys.BINDIR, Base.LIBEXECDIR, p7zip_exe)
    if isfile(bundled_p7zip_path)
        global p7zip_path = abspath(bundled_p7zip_path)
    else
        global p7zip_path = Sys.which(p7zip_exe)
    end
end

end  # module p7zip_jll
