# This file is a part of Julia. License is MIT: https://julialang.org/license

## dummy stub for https://github.com/JuliaBinaryWrappers/LibMbedTLS_jll.jl

module LibMbedTLS_jll

using Libdl

const PATH_list = String[]
const LIBPATH_list = String[]

export libmbedcrypto, libmbedtls, libmbedx509

# These get calculated in __init__()
libmbedcrypto_handle = C_NULL
libmbedcrypto_path = ""
libmbedtls_handle = C_NULL
libmbedtls_path = ""
libmbedx509_handle = C_NULL
libmbedx509_path = ""

if Sys.iswindows()
    const libmbedcrypto = "libmbedcrypto.dll"
    const libmbedtls = "libmbedtls.dll"
    const libmbedx509 = "libmbedx509.dll"
elseif Sys.isapple()
    const libmbedcrypto = "libmbedcrypto.5.dylib"
    const libmbedtls = "libmbedtls.13.dylib"
    const libmbedx509 = "libmbedx509.1.dylib"
else
    const libmbedcrypto = "libmbedcrypto.so.5"
    const libmbedtls = "libmbedtls.so.13"
    const libmbedx509 = "libmbedx509.so.1"
end

function __init__()
    global libmbedcrypto_handle = dlopen(libmbedcrypto)
    global libmbedcrypto_path = dlpath(libmbedcrypto_handle)
    global libmbedtls_handle = dlopen(libmbedtls)
    global libmbedtls_path = dlpath(libmbedtls_handle)
    global libmbedx509_handle = dlopen(libmbedx509)
    global libmbedx509_path = dlpath(libmbedx509_handle)
end

end  # module LibMbedTLS_jll
