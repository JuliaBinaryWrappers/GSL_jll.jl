# Autogenerated wrapper script for GSL_jll for powerpc64le-linux-gnu
export libgslcblas, gsl_randist, gsl_histogram, libgsl

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libgslcblas`
const libgslcblas_splitpath = ["lib", "libgslcblas.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgslcblas_path = ""

# libgslcblas-specific global declaration
# This will be filled out by __init__()
libgslcblas_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgslcblas = "libgslcblas.so.0"


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
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(gsl_randist_path)
    end
end


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
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(gsl_histogram_path)
    end
end


# Relative path to `libgsl`
const libgsl_splitpath = ["lib", "libgsl.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgsl_path = ""

# libgsl-specific global declaration
# This will be filled out by __init__()
libgsl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgsl = "libgsl.so.25"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"GSL")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libgslcblas_path = normpath(joinpath(artifact_dir, libgslcblas_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgslcblas_handle = dlopen(libgslcblas_path)
    push!(LIBPATH_list, dirname(libgslcblas_path))

    global gsl_randist_path = normpath(joinpath(artifact_dir, gsl_randist_splitpath...))

    push!(PATH_list, dirname(gsl_randist_path))
    global gsl_histogram_path = normpath(joinpath(artifact_dir, gsl_histogram_splitpath...))

    push!(PATH_list, dirname(gsl_histogram_path))
    global libgsl_path = normpath(joinpath(artifact_dir, libgsl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgsl_handle = dlopen(libgsl_path)
    push!(LIBPATH_list, dirname(libgsl_path))

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

