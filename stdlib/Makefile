default: install

SRCDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
JULIAHOME := $(abspath $(SRCDIR)/..)
SRCCACHE := $(abspath $(SRCDIR)/srccache)
BUILDDIR := .

include $(JULIAHOME)/Make.inc
include $(JULIAHOME)/deps/tools/common.mk
include $(JULIAHOME)/deps/tools/stdlib-external.mk

VERSDIR := v$(shell cut -d. -f1-2 < $(JULIAHOME)/VERSION)

$(build_datarootdir)/julia/stdlib/$(VERSDIR):
	mkdir -p $@

JLLS = dSFMT_jll GMP_jll LibCURL_jll LibGit2_jll libLLVM_jll LibSSH2_jll \
       LibUV_jll MbedTLS_jll MozillaCACerts_jll MPFR_jll nghttp2_jll \
       OpenBLAS_jll OpenLibm_jll p7zip_jll PCRE2_jll SuiteSparse_jll Zlib_jll \
       LibOSXUnwind_jll LibUnwind_jll

# Define rule to download `Artifacts.toml` file for each JLL we bundle.
define download-artifacts-toml
$$(JULIAHOME)/stdlib/$(1)/Artifacts.toml:
	$(JLDOWNLOAD) $$@ https://github.com/JuliaBinaryWrappers/$(1).jl/raw/main/Artifacts.toml
get-$(1): $$(JULIAHOME)/stdlib/$(1)/Artifacts.toml
endef
$(foreach jll,$(JLLS),$(eval $(call download-artifacts-toml,$(jll))))

STDLIBS = Artifacts Base64 CRC32c Dates DelimitedFiles Distributed FileWatching \
          Future InteractiveUtils Libdl LibGit2 LinearAlgebra Logging \
          Markdown Mmap Printf Profile Random REPL Serialization SHA \
SharedArrays Sockets SparseArrays SuiteSparse Test TOML Unicode UUIDs \
          $(JLLS)

STDLIBS_EXT = Pkg Statistics LibCURL Downloads ArgTools Tar NetworkOptions
PKG_GIT_URL := git://github.com/JuliaLang/Pkg.jl.git
PKG_TAR_URL = https://api.github.com/repos/JuliaLang/Pkg.jl/tarball/$1
STATISTICS_GIT_URL := git://github.com/JuliaLang/Statistics.jl.git
STATISTICS_TAR_URL = https://api.github.com/repos/JuliaLang/Statistics.jl/tarball/$1
LIBCURL_GIT_URL := git://github.com/JuliaWeb/LibCURL.jl.git
LIBCURL_TAR_URL = https://api.github.com/repos/JuliaWeb/LibCURL.jl/tarball/$1
DOWNLOADS_GIT_URL := git://github.com/JuliaLang/Downloads.jl.git
DOWNLOADS_TAR_URL = https://api.github.com/repos/JuliaLang/Downloads.jl/tarball/$1
ARGTOOLS_GIT_URL := git://github.com/JuliaIO/ArgTools.jl.git
ARGTOOLS_TAR_URL = https://api.github.com/repos/JuliaIO/ArgTools.jl/tarball/$1
TAR_GIT_URL := git://github.com/JuliaIO/Tar.jl.git
TAR_TAR_URL = https://api.github.com/repos/JuliaIO/Tar.jl/tarball/$1
NETWORKOPTIONS_GIT_URL := git://github.com/JuliaLang/NetworkOptions.jl.git
NETWORKOPTIONS_TAR_URL = https://api.github.com/repos/JuliaLang/NetworkOptions.jl/tarball/$1

$(foreach module, $(STDLIBS_EXT), $(eval $(call stdlib-external,$(module),$(shell echo $(module) | tr a-z A-Z))))

# Generate symlinks to all stdlibs at usr/share/julia/stdlib/vX.Y/
$(foreach module, $(STDLIBS), $(eval $(call symlink_target,$$(JULIAHOME)/stdlib/$(module),$$(build_datarootdir)/julia/stdlib/$$(VERSDIR),$(module))))

STDLIBS_LINK_TARGETS := $(addprefix $(build_datarootdir)/julia/stdlib/$(VERSDIR)/,$(STDLIBS))

getall get: $(addprefix get-, $(STDLIBS_EXT) $(JLLS))
install: $(addprefix install-, $(STDLIBS_EXT)) $(STDLIBS_LINK_TARGETS)
clean: $(addprefix clean-, $(STDLIBS_EXT)) $(CLEAN_TARGETS)
distclean: $(addprefix distclean-, $(STDLIBS_EXT)) clean

DEP_LIBS_STAGED := $(STDLIBS_EXT)
include $(JULIAHOME)/deps/tools/uninstallers.mk
