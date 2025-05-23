# Autogenerated wrapper script for GSL_jll for i686-w64-mingw32
export gsl_histogram, gsl_randist, libgsl, libgslcblas

JLLWrappers.@generate_wrapper_header("GSL")
JLLWrappers.@declare_library_product(libgsl, "libgsl-28.dll")
JLLWrappers.@declare_library_product(libgslcblas, "libgslcblas-0.dll")
JLLWrappers.@declare_executable_product(gsl_histogram)
JLLWrappers.@declare_executable_product(gsl_randist)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libgsl,
        "bin\\libgsl-28.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libgslcblas,
        "bin\\libgslcblas-0.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        gsl_histogram,
        "bin\\gsl-histogram.exe",
    )

    JLLWrappers.@init_executable_product(
        gsl_randist,
        "bin\\gsl-randist.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
