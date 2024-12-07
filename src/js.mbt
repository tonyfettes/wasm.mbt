///|
type Memory

///|
extern "js" fn Memory::new(initial~ : Int, maximum~ : Int) -> Memory =
  #|(initial, maximum) => {
  #|  return new WebAssembly.Memory({ initial, maximum })
  #|}

///|
let memory_default : Memory = Memory::new(initial=256, maximum=512)

///|
pub extern "js" fn i32_extend16_s(value : Int) -> Int =
  #|(value) => {
  #|  return (value << 16) >> 16;
  #|}

///|
pub extern "js" fn i32_extend8_s(value : Int) -> Int =
  #|(value) => {
  #|  return (value << 24) >> 24;
  #|}

///|
pub extern "js" fn i32_store8(
  memory~ : Memory = memory_default,
  offset : Int,
  value : Int
) =
  #|(memory, offset, value) => {
  #|  return new DataView(memory.buffer).setInt8(offset, value);
  #|}

///|
pub extern "js" fn i32_load8_u(
  memory~ : Memory = memory_default,
  offset : Int
) -> Int =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getUint8(offset);
  #|}

///|
pub extern "js" fn i32_load8_s(
  memory~ : Memory = memory_default,
  offset : Int
) -> Int =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getInt8(offset);
  #|}

///|
pub extern "js" fn i32_store16(
  memory~ : Memory = memory_default,
  offset : Int,
  value : Int
) =
  #|(memory, offset, value) => {
  #|  return new DataView(memory.buffer).setInt16(offset, value, true);
  #|}

///|
pub extern "js" fn i32_load16_s(
  memory~ : Memory = memory_default,
  offset : Int
) -> Int =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getInt16(offset, true);
  #|}

///|
pub extern "js" fn i32_load16_u(
  memory~ : Memory = memory_default,
  offset : Int
) -> Int =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getUint16(offset, true);
  #|}

///|
pub extern "js" fn i32_store(
  memory~ : Memory = memory_default,
  offset : Int,
  value : Int
) =
  #|(memory, offset, value) => {
  #|  return new DataView(memory.buffer).setInt32(offset, value, true);
  #|}

///|
pub extern "js" fn i32_load(
  memory~ : Memory = memory_default,
  offset : Int
) -> Int =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getInt32(offset, true);
  #|}

///|
pub extern "js" fn i64_store(
  memory~ : Memory = memory_default,
  offset : Int,
  value : Int64
) =
  #|(memory, offset, value) => {
  #|  return new DataView(memory.buffer).setBigInt64(offset, BigInt(value), true);
  #|}

///|
pub extern "js" fn i64_load(
  memory~ : Memory = memory_default,
  offset : Int
) -> Int64 =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getBigInt64(offset, true);
  #|}

///|
pub extern "js" fn f32_store(
  memory~ : Memory = memory_default,
  offset : Int,
  value : Float
) =
  #|(memory, offset, value) => {
  #|  return new DataView(memory.buffer).setFloat32(offset, value, true);
  #|}

///|
pub extern "js" fn f32_load(
  memory~ : Memory = memory_default,
  offset : Int
) -> Float =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getFloat32(offset, true);
  #|}

///|
pub extern "js" fn f64_store(
  memory~ : Memory = memory_default,
  offset : Int,
  value : Double
) =
  #|(memory, offset, value) => {
  #|  return new DataView(memory.buffer).setFloat64(offset, value, true);
  #|}

///|
pub extern "js" fn f64_load(
  memory~ : Memory = memory_default,
  offset : Int
) -> Double =
  #|(memory, offset) => {
  #|  return new DataView(memory.buffer).getFloat64(offset, true);
  #|}

///|
pub extern "js" fn memory_copy(dst : Int, src : Int, len : Int) =
  #|(dst, src, len) => {
  #|  return new Uint8Array(memory.buffer).copyWithin(dst, src, src + len);
  #|}

///|
pub extern "js" fn memory_size() -> Int =
  #|() => {
  #|  return memory.buffer.byteLength / 65536;
  #|}

///|
pub extern "js" fn memory_grow(size : Int) -> Int =
  #|(size) => {
  #|  return memory.grow(size);
  #|}

///|
pub extern "js" fn memory_atomic_wait32(
  address : Int,
  expected : Int,
  timeout : Int64
) -> Int =
  #|(address, expected, timeout) => {
  #|  return Atomics.wait(
  #|    new Int32Array(memory.buffer),
  #|    address / 4,
  #|    expected,
  #|    timeout
  #|  );
  #|}

///|
pub extern "js" fn memory_atomic_wait64(
  address : Int,
  expected : Int64,
  timeout : Int64
) -> Int =
  #|(address, expected, timeout) => {
  #|  return Atomics.wait(
  #|    new BigInt64Array(memory.buffer),
  #|    address / 8,
  #|    BigInt(expected),
  #|    BigInt(timeout)
  #|  );
  #|}

///|
pub extern "js" fn memory_atomic_notify(address : Int, count : Int) =
  #|(address, count) => {
  #|  return Atomics.notify(new Int32Array(memory.buffer), address / 4, count);
  #|}
