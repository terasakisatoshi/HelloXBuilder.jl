using BinaryBuilder

name = "HelloX"
version = v"0.0.1"

# No sources, we're just building the testsuite
sources = [
    GitSource(
        "https://github.com/terasakisatoshi/HelloX.jl.git",
        "f9d7012cdf3189a8076b469b005142d01154b694",
    )
]
# Bash recipe for building across all platforms
script = raw"""
ls
install_license /usr/share/licenses/MIT
"""
# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = [
    Linux(:x86_64; libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
]
# The products that we will ensure are always built
products = [
    ExecutableProduct("HelloX", :HelloX),
]
# Dependencies that must be installed before this package can be built
dependencies = Dependency[
]
# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies; preferred_gcc_version = v"7")