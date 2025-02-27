cmake_minimum_required(VERSION 3.19)
project(wasm.mbt LANGUAGES C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -fsanitize=address -Wmissing-field-initializers -lm")

include(CMakePrintHelpers)
set(MOON_HOME "$ENV{MOON_HOME}")
cmake_print_variables(MOON_HOME)

include(cmake/MoonBit.cmake)

setup_moonbit_module(.)

add_library(wasm.mbt::moonbit ALIAS moonbit)

add_library(wasm.mbt STATIC src/wasm.c)
add_library(wasm.mbt::wasm.mbt ALIAS wasm.mbt)
target_link_libraries(wasm.mbt PRIVATE moonbit)

include(GNUInstallDirs)
install(
  TARGETS wasm.mbt
  EXPORT WASMTargets
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(
  TARGETS moonbit
  EXPORT WASMTargets
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(
  EXPORT WASMTargets
  NAMESPACE wasm.mbt::
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/wasm.mbt
  FILE WASMTargets.cmake)
export(EXPORT WASMTargets FILE ${CMAKE_CURRENT_BINARY_DIR}/WASMTargets.cmake)
include(CMakePackageConfigHelpers)
configure_package_config_file(
  ${CMAKE_CURRENT_LIST_DIR}/cmake/Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/wasm.mbt-config.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/wasm.mbt
)
install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/wasm.mbt-config.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/wasm.mbt
)

add_moon_module(test)
