///|
pub extern "wasm" fn i32_extend16_s(value : Int) -> Int =
  #|(func (param i32) (result i32)
  #| local.get 0
  #| i32.extend16_s)

///|
pub extern "wasm" fn i32_extend8_s(value : Int) -> Int =
  #|(func (param i32) (result i32)
  #| local.get 0
  #| i32.extend8_s)

///|
type Memory Int

///|
extern "wasm" fn i32_store8_ffi(memory~ : Int = 0, offset : Int, value : Int) =
  #|(func (param i32) (param i32) (param i32)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| i32.store8)

///|
pub fn i32_store8(memory~ : Memory = 0, offset : Int, value : Int) -> Unit {
  i32_store8_ffi(memory=memory._, offset, value)
}

///|
extern "wasm" fn i32_load8_u_ffi(memory~ : Int = 0, offset : Int) -> Int =
  #|(func (param i32) (param i32) (result i32)
  #| local.get 0
  #| local.get 1
  #| i32.load8_u)

///|
pub fn i32_load8_u(memory~ : Memory = 0, offset : Int) -> Int {
  i32_load8_u_ffi(memory=memory._, offset)
}

///|
extern "wasm" fn i32_load8_s_ffi(memory~ : Int = 0, offset : Int) -> Int =
  #|(func (param i32) (param i32) (result i32)
  #| local.get 0
  #| local.get 1
  #| i32.load8_s)

///|
pub fn i32_load8_s(memory~ : Memory = 0, offset : Int) -> Int {
  i32_load8_s_ffi(memory=memory._, offset)
}

///|
extern "wasm" fn i32_store16_ffi(memory~ : Int = 0, offset : Int, value : Int) =
  #|(func (param i32) (param i32) (param i32)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| i32.store16)

///|
pub fn i32_store16(memory~ : Memory = 0, offset : Int, value : Int) -> Unit {
  i32_store16_ffi(memory=memory._, offset, value)
}

///|
extern "wasm" fn i32_load16_s_ffi(memory~ : Int = 0, offset : Int) -> Int =
  #|(func (param i32) (param i32) (result i32)
  #| local.get 0
  #| local.get 1
  #| i32.load16_s)

///|
pub fn i32_load16_s(memory~ : Memory = 0, offset : Int) -> Int {
  i32_load16_s_ffi(memory=memory._, offset)
}

///|
extern "wasm" fn i32_load16_u_ffi(memory~ : Int = 0, offset : Int) -> Int =
  #|(func (param i32) (param i32) (result i32)
  #| local.get 0
  #| local.get 1
  #| i32.load16_u)

///|
pub fn i32_load16_u(memory~ : Memory = 0, offset : Int) -> Int {
  i32_load16_u_ffi(memory=memory._, offset)
}

///|
extern "wasm" fn i32_store_ffi(memory~ : Int = 0, offset : Int, value : Int) =
  #|(func (param i32) (param i32) (param i32)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| i32.store)

///|
pub fn i32_store(memory~ : Memory = 0, offset : Int, value : Int) -> Unit {
  i32_store_ffi(memory=memory._, offset, value)
}

///|
extern "wasm" fn i32_load_ffi(memory~ : Int = 0, offset : Int) -> Int =
  #|(func (param i32) (param i32) (result i32)
  #| local.get 0
  #| local.get 1
  #| i32.load)

///|
pub fn i32_load(memory~ : Memory = 0, offset : Int) -> Int {
  i32_load_ffi(memory=memory._, offset)
}

///|
extern "wasm" fn i64_store_ffi(memory~ : Int = 0, offset : Int, value : Int64) =
  #|(func (param i32) (param i32) (param i64)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| i64.store)

///|
pub fn i64_store(memory~ : Memory = 0, offset : Int, value : Int64) -> Unit {
  i64_store_ffi(memory=memory._, offset, value)
}

///|
extern "wasm" fn i64_load_ffi(memory~ : Int = 0, offset : Int) -> Int64 =
  #|(func (param i32) (param i32) (result i64)
  #| local.get 0
  #| local.get 1
  #| i64.load)

///|
pub fn i64_load(memory~ : Memory = 0, offset : Int) -> Int64 {
  i64_load_ffi(memory=memory._, offset)
}

///|
extern "wasm" fn f32_store_ffi(memory~ : Int = 0, offset : Int, value : Float) =
  #|(func (param i32) (param i32) (param f32)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| f32.store)

///|
pub fn f32_store(memory~ : Memory = 0, offset : Int, value : Float) -> Unit {
  f32_store_ffi(memory=memory._, offset, value)
}

///|
extern "wasm" fn f32_load_ffi(memory~ : Int = 0, offset : Int) -> Float =
  #|(func (param i32) (param i32) (result f32)
  #| local.get 0
  #| local.get 1
  #| f32.load)

///|
pub fn f32_load(memory~ : Memory = 0, offset : Int) -> Float {
  f32_load_ffi(memory=memory._, offset)
}

///|
extern "wasm" fn f64_store_ffi(memory~ : Int = 0, offset : Int, value : Double) =
  #|(func (param i32) (param i32) (param f64)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| f64.store)

///|
pub fn f64_store(memory~ : Memory = 0, offset : Int, value : Double) -> Unit {
  f64_store_ffi(memory=memory._, offset, value)
}

///|
extern "wasm" fn f64_load_ffi(memory~ : Int = 0, offset : Int) -> Double =
  #|(func (param i32) (param i32) (result f64)
  #| local.get 0
  #| local.get 1
  #| f64.load)

///|
pub fn f64_load(memory~ : Memory = 0, offset : Int) -> Double {
  f64_load_ffi(memory=memory._, offset)
}

///|
pub extern "wasm" fn memory_copy(dst : Int, src : Int, len : Int) =
  #|(func (param i32) (param i32) (param i32)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| memory.copy)

///|
pub extern "wasm" fn memory_size() -> Int =
  #|(func (result i32)
  #| memory.size)

///|
pub extern "wasm" fn memory_grow(size : Int) -> Int =
  #|(func (param i32) (result i32)
  #| local.get 0
  #| memory.grow)

///|
pub extern "wasm" fn memory_atomic_wait32(
  address : Int,
  expected : Int,
  timeout : Int64
) -> Int =
  #|(func (param i32) (param i32) (param i64) (result i32)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| memory.atomic.wait32)

///|
pub extern "wasm" fn memory_atomic_wait64(
  address : Int,
  expected : Int64,
  timeout : Int64
) -> Int =
  #|(func (param i32) (param i64) (param i64) (result i32)
  #| local.get 0
  #| local.get 1
  #| local.get 2
  #| memory.atomic.wait64)

///|
pub extern "wasm" fn memory_atomic_notify(address : Int, count : Int) =
  #|(func (param i32) (param i32)
  #| local.get 0
  #| local.get 1
  #| memory.atomic.notify)
