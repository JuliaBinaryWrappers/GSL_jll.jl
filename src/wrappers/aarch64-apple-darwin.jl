# Autogenerated wrapper script for GSL_jll for aarch64-apple-darwin
export gsl_histogram, gsl_randist, libgsl, libgslcblas

JLLWrappers.@generate_wrapper_header("GSL")
JLLWrappers.@declare_executable_product(gsl_histogram)
JLLWrappers.@declare_executable_product(gsl_randist)
JLLWrappers.@declare_library_product(libgsl, "@rpath/libgsl.25.dylib")
JLLWrappers.@declare_library_product(libgslcblas, "@rpath/libgslcblas.0.dylib")
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_executable_product(
        gsl_histogram,
        "bin/gsl-histogram",
    )

    JLLWrappers.@init_executable_product(
        gsl_randist,
        "bin/gsl-randist",
    )

    JLLWrappers.@init_library_product(
        libgsl,
        "lib/libgsl.25.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libgslcblas,
        "lib/libgslcblas.0.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
