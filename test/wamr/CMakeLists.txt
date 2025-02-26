set(WAMR_BUILD_PLATFORM "darwin")
set(WAMR_BUILD_INTERP 1)
set(WAMR_BUILD_FAST_INTERP 1)
set(WAMR_BUILD_AOT 1)
set(WAMR_BUILD_LIBC_BUILTIN 1)
set(WAMR_BUILD_LIBC_WASI 1)
set(WAMR_BUILD_SIMD 1)
set(WAMR_ROOT_DIR wasm-micro-runtime)

include(${WAMR_ROOT_DIR}/build-scripts/runtime_lib.cmake)
add_library(vmlib ${WAMR_RUNTIME_LIB_SOURCE})

add_moon_executable(wamr)
target_link_libraries(wamr PRIVATE wasm.mbt vmlib)
