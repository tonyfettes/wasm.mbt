///|
fn main {
  let args = @sys.get_cli_args()
  let engine = @wasm.Engine::new()
  let store = @wasm.Store::new(engine)
  let binary = @fs.read_file_to_bytes?(args[1]).unwrap()
  let module_ = @wasm.Module::new(store, binary)
  let instance = @wasm.Instance::new(store, module_, [])
  let exports = instance.exports()
  guard exports[0].as_func().unwrap().call([@wasm.Val::I32(0)])
    is [@wasm.Val::I32(result)]
  println("result: \{result}")
}
