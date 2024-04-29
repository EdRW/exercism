pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  fn(arg: Int) {
    arg + secret
  }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  fn(arg: Int) {
    arg - secret
  }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  fn(arg: Int) {
    arg * secret
  }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
    fn(arg: Int) {
    arg / secret
  }
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
    fn(arg: Int) {
    secret_function1(arg)
    |> secret_function2
  }
}
