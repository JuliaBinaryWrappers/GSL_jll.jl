# Autogenerated wrapper script for GSL_jll for aarch64-linux-gnu
export gsl_histogram, gsl_randist, libgsl, libgslcblas

JLLWrappers.@generate_wrapper_header("GSL")
JLLWrappers.@declare_library_product(libgsl, "libgsl.so.28")
JLLWrappers.@declare_library_product(libgslcblas, "libgslcblas.so.0")
JLLWrappers.@declare_executable_product(gsl_histogram)
JLLWrappers.@declare_executable_product(gsl_randist)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libgsl,
        "lib/libgsl.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libgslcblas,
        "lib/libgslcblas.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        gsl_histogram,
        "bin/gsl-histogram",
    )

    JLLWrappers.@init_executable_product(
        gsl_randist,
        "bin/gsl-randist",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
