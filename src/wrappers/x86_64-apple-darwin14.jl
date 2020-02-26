# Autogenerated wrapper script for GSL_jll for x86_64-apple-darwin14
export libgsl, gsl_histogram, gsl_randist, libgslcblas

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"

# Relative path to `libgsl`
const libgsl_splitpath = ["lib", "libgsl.25.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgsl_path = ""

# libgsl-specific global declaration
# This will be filled out by __init__()
libgsl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgsl = "@rpath/libgsl.25.dylib"


# Relative path to `gsl_histogram`
const gsl_histogram_splitpath = ["bin", "gsl-histogram"]

# This will be filled out by __init__() for all products, as it must be done at runtime
gsl_histogram_path = ""

# gsl_histogram-specific global declaration
function gsl_histogram(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(gsl_histogram_path)
    end
end


# Relative path to `gsl_randist`
const gsl_randist_splitpath = ["bin", "gsl-randist"]

# This will be filled out by __init__() for all products, as it must be done at runtime
gsl_randist_path = ""

# gsl_randist-specific global declaration
function gsl_randist(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(gsl_randist_path)
    end
end


# Relative path to `libgslcblas`
const libgslcblas_splitpath = ["lib", "libgslcblas.0.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgslcblas_path = ""

# libgslcblas-specific global declaration
# This will be filled out by __init__()
libgslcblas_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgslcblas = "@rpath/libgslcblas.0.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"GSL")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libgsl_path = normpath(joinpath(artifact_dir, libgsl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgsl_handle = dlopen(libgsl_path)
    push!(LIBPATH_list, dirname(libgsl_path))

    global gsl_histogram_path = normpath(joinpath(artifact_dir, gsl_histogram_splitpath...))

    push!(PATH_list, dirname(gsl_histogram_path))
    global gsl_randist_path = normpath(joinpath(artifact_dir, gsl_randist_splitpath...))

    push!(PATH_list, dirname(gsl_randist_path))
    global libgslcblas_path = normpath(joinpath(artifact_dir, libgslcblas_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgslcblas_handle = dlopen(libgslcblas_path)
    push!(LIBPATH_list, dirname(libgslcblas_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

