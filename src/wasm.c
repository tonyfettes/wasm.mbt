#include "wasm-c-api/include/wasm.h"
#include <math.h>
#include <moonbit.h>
#include <stdint.h>
#include <stdlib.h>

void *
moonbit_c_null() {
  return NULL;
}

bool
moonbit_c_is_null(void *ptr) {
  return ptr == NULL;
}

wasm_engine_t *
moonbit_wasm_engine_new() {
  return wasm_engine_new();
}

wasm_store_t *
moonbit_wasm_store_new(wasm_engine_t *engine) {
  return wasm_store_new(engine);
}

bool
moonbit_wasm_module_validate(
  wasm_store_t *store,
  const wasm_byte_vec_t *binary
) {
  return wasm_module_validate(store, binary);
}

static_assert(sizeof(wasm_byte_t) == sizeof(char), "incompatible byte type");

wasm_module_t *
moonbit_wasm_module_new(wasm_store_t *store, const moonbit_bytes_t binary) {
  const size_t binary_length = Moonbit_array_length(binary);
  wasm_byte_vec_t byte_vec;
  wasm_byte_vec_new(&byte_vec, binary_length, (const char *)binary);
  wasm_module_t *module = wasm_module_new(store, &byte_vec);
  wasm_byte_vec_delete(&byte_vec);
  return module;
}

void
moonbit_wasm_module_delete(wasm_module_t *module) {
  wasm_module_delete(module);
}

wasm_func_t *
moonbit_wasm_extern_as_func(wasm_extern_t *extern_) {
  wasm_func_t *func = wasm_extern_as_func(extern_);
  return func;
}

wasm_instance_t *
moonbit_wasm_instance_new(
  wasm_store_t *store,
  wasm_module_t *module,
  void **imports
) {
  wasm_extern_vec_t imports_vec = {
    .size = Moonbit_array_length(imports), .data = (wasm_extern_t **)imports
  };
  wasm_instance_t *instance =
    wasm_instance_new(store, module, &imports_vec, NULL);
  moonbit_decref(imports);
  return instance;
}

wasm_extern_vec_t *
moonbit_wasm_instance_exports(wasm_instance_t *instance) {
  wasm_extern_vec_t *exports = malloc(sizeof(wasm_extern_vec_t));
  wasm_instance_exports(instance, exports);
  return exports;
}

wasm_extern_vec_t *
moonbit_wasm_extern_vec_new() {
  wasm_extern_vec_t *vec = malloc(sizeof(wasm_extern_vec_t));
  wasm_extern_vec_new_empty(vec);
  return vec;
}

wasm_extern_t *
moonbit_wasm_extern_vec_get(wasm_extern_vec_t *vec, uint32_t index) {
  return vec->data[index];
}

void
moonbit_wasm_extern_vec_delete(wasm_extern_vec_t *vec) {
  wasm_extern_vec_delete(vec);
  free(vec);
}

wasm_val_vec_t *
moonbit_wasm_val_vec_new_uninitialized(int size) {
  wasm_val_vec_t *vec = malloc(sizeof(wasm_val_vec_t));
  wasm_val_vec_new_uninitialized(vec, size);
  return vec;
}

int
moonbit_wasm_val_vec_size(wasm_val_vec_t *vec) {
  return vec->size;
}

void
moonbit_wasm_val_vec_set_i32(wasm_val_vec_t *vec, int index, int val) {
  vec->data[index].kind = WASM_I32;
  vec->data[index].of.i32 = val;
}

void
moonbit_wasm_val_vec_set_i64(wasm_val_vec_t *vec, int index, int64_t val) {
  vec->data[index].kind = WASM_I64;
  vec->data[index].of.i64 = val;
}

void
moonbit_wasm_val_vec_set_f32(wasm_val_vec_t *vec, int index, float val) {
  vec->data[index].kind = WASM_F32;
  vec->data[index].of.f32 = val;
}

void
moonbit_wasm_val_vec_set_f64(wasm_val_vec_t *vec, int index, double val) {
  vec->data[index].kind = WASM_F64;
  vec->data[index].of.f64 = val;
}

void
moonbit_wasm_val_vec_delete(wasm_val_vec_t *vec) {
  wasm_val_vec_delete(vec);
  free(vec);
}

int
moonbit_wasm_val_vec_get_valkind(wasm_val_vec_t *vec, int index) {
  return vec->data[index].kind;
}

int
moonbit_wasm_val_vec_get_i32(wasm_val_vec_t *vec, int index) {
  return vec->data[index].of.i32;
}

int64_t
moonbit_wasm_val_vec_get_i64(wasm_val_vec_t *vec, int index) {
  return vec->data[index].of.i64;
}

float
moonbit_wasm_val_vec_get_f32(wasm_val_vec_t *vec, int index) {
  return vec->data[index].of.f32;
}

double
moonbit_wasm_val_vec_get_f64(wasm_val_vec_t *vec, int index) {
  return vec->data[index].of.f64;
}

int
moonbit_wasm_func_param_arity(wasm_func_t *func) {
  return wasm_func_param_arity(func);
}

int
moonbit_wasm_func_result_arity(wasm_func_t *func) {
  return wasm_func_result_arity(func);
}

void
moonbit_wasm_func_call(
  wasm_func_t *func,
  wasm_val_vec_t *args,
  wasm_val_vec_t *results
) {
  wasm_val_t a;
  wasm_func_call(func, args, results);
}