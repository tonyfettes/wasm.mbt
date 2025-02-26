///|
extern type Engine

///|
pub extern "c" fn Engine::new() -> Engine = "moonbit_wasm_engine_new"

///|
extern type Store

///|
pub extern "c" fn Store::new(engine : Engine) -> Store = "moonbit_wasm_store_new"

///|
extern type Module

///|
pub extern "c" fn Module::new(store : Store, binary : Bytes) -> Module = "moonbit_wasm_module_new"

///|
pub extern "c" fn Module::delete(self : Module) = "moonbit_wasm_module_delete"

///|
extern type Func

///|
extern "c" fn Func::param_arity(self : Func) -> Int = "moonbit_wasm_func_param_arity"

///|
extern "c" fn Func::result_arity(self : Func) -> Int = "moonbit_wasm_func_result_arity"

///|
extern "c" fn Func::_call(self : Func, args : ValVec, results : ValVec) -> Unit = "moonbit_wasm_func_call"

///|
pub fn Func::call(self : Func, params : Array[Val]) -> Array[Val] {
  let params_vec = ValVec::of(params)
  let results_vec = ValVec::new_uninitialized(self.result_arity())
  self._call(params_vec, results_vec)
  results_vec.to()
}

///|
extern type Extern

///|
extern "c" fn Extern::_as_func(self : Extern) -> Nullable[Func] = "moonbit_wasm_extern_as_func"

///|
pub fn Extern::as_func(self : Extern) -> Func? {
  self._as_func().to()
}

///|
extern type ExternVec

///|
extern "c" fn ExternVec::new() -> ExternVec = "moonbit_wasm_extern_vec_new"

///|
pub extern "c" fn ExternVec::get(self : ExternVec, index : Int) -> Extern = "moonbit_wasm_extern_vec_get"

///|
pub extern "c" fn ExternVec::op_get(self : ExternVec, index : Int) -> Extern = "moonbit_wasm_extern_vec_get"

///|
extern "c" fn ExternVec::delete(self : ExternVec) = "moonbit_wasm_extern_vec_delete"

///|
extern type Instance

///|
pub extern "c" fn Instance::new(
  store : Store,
  module_ : Module,
  imports : Array[Extern]
) -> Instance = "moonbit_wasm_instance_new"

///|
pub extern "c" fn Instance::exports(instance : Instance) -> ExternVec = "moonbit_wasm_instance_exports"

///|
pub extern "c" fn Instance::delete(self : Instance) = "moonbit_wasm_instance_delete"

///|
pub(all) enum ValKind {
  I32
  I64
  F32
  F64
}

///|
fn ValKind::of_int(kind : Int) -> ValKind {
  match kind {
    0 => ValKind::I32
    1 => ValKind::I64
    2 => ValKind::F32
    3 => ValKind::F64
    kind => abort("invalid ValKind: \{kind}")
  }
}

///|
pub(all) enum Val {
  I32(Int)
  I64(Int)
  F32(Float)
  F64(Float)
}

///|
extern type ValVec

///|
extern "c" fn ValVec::new_uninitialized(size : Int) -> ValVec = "moonbit_wasm_val_vec_new_uninitialized"

///|
extern "c" fn ValVec::size(self : ValVec) -> Int = "moonbit_wasm_val_vec_size"

///|
extern "c" fn ValVec::set_i32(self : ValVec, index : Int, val : Int) = "moonbit_wasm_val_vec_set_i32"

///|
extern "c" fn ValVec::set_i64(self : ValVec, index : Int, val : Int) = "moonbit_wasm_val_vec_set_i64"

///|
extern "c" fn ValVec::set_f32(self : ValVec, index : Int, val : Float) = "moonbit_wasm_val_vec_set_f32"

///|
extern "c" fn ValVec::set_f64(self : ValVec, index : Int, val : Float) = "moonbit_wasm_val_vec_set_f64"

///|
extern "c" fn ValVec::_get_valkind(self : ValVec, index : Int) -> Int = "moonbit_wasm_val_vec_get_valkind"

///|
fn ValVec::get_valkind(self : ValVec, index : Int) -> ValKind {
  ValKind::of_int(self._get_valkind(index))
}

///|
extern "c" fn ValVec::get_i32(self : ValVec, index : Int) -> Int = "moonbit_wasm_val_vec_get_i32"

///|
extern "c" fn ValVec::get_i64(self : ValVec, index : Int) -> Int = "moonbit_wasm_val_vec_get_i64"

///|
extern "c" fn ValVec::get_f32(self : ValVec, index : Int) -> Float = "moonbit_wasm_val_vec_get_f32"

///|
extern "c" fn ValVec::get_f64(self : ValVec, index : Int) -> Float = "moonbit_wasm_val_vec_get_f64"

///|
pub fn ValVec::op_set(self : ValVec, index : Int, val : Val) -> Unit {
  match val {
    Val::I32(i) => self.set_i32(index, i)
    Val::I64(i) => self.set_i64(index, i)
    Val::F32(f) => self.set_f32(index, f)
    Val::F64(f) => self.set_f64(index, f)
  }
}

///|
pub fn ValVec::of(val : Array[Val]) -> ValVec {
  let vec = ValVec::new_uninitialized(val.length())
  for i, v in val {
    vec[i] = v
  }
  vec
}

///|
pub fn ValVec::to(self : ValVec) -> Array[Val] {
  let vals = []
  for i in 0..<self.size() {
    match self.get_valkind(i) {
      ValKind::I32 => vals.push(Val::I32(self.get_i32(i)))
      ValKind::I64 => vals.push(Val::I64(self.get_i64(i)))
      ValKind::F32 => vals.push(Val::F32(self.get_f32(i)))
      ValKind::F64 => vals.push(Val::F64(self.get_f64(i)))
    }
  }
  vals
}
