///|
priv extern type Nullable[_]

///|
fn Nullable::some[T](value : T) -> Nullable[T] = "%identity"

///|
fn Nullable::unwrap[T](self : Nullable[T]) -> T = "%identity"

///|
fn Nullable::null() -> Nullable[Unit] = "moonbit_c_null"

///|
fn Nullable::cast[T, U](self : Nullable[T]) -> Nullable[U] = "%identity"

///|
fn Nullable::none[T]() -> Nullable[T] {
  Nullable::null().cast()
}

///|
extern "c" fn Nullable::is_null(self : Nullable[Unit]) -> Bool = "moonbit_c_is_null"

///|
fn Nullable::of[T](option : T?) -> Nullable[T] {
  match option {
    Some(value) => Nullable::some(value)
    None => Nullable::none()
  }
}

///|
fn Nullable::to[T](self : Nullable[T]) -> T? {
  if self.cast().is_null() {
    return None
  } else {
    return Some(self.unwrap())
  }
}
