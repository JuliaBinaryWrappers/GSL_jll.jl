# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule GSL_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("GSL")
JLLWrappers.@generate_main_file("GSL", UUID("1b77fbbe-d8ee-58f0-85f9-836ddc23a7a4"))
end  # module GSL_jll
